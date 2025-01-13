import 'dart:convert';
import 'dart:mirrors';
import 'package:api_open_builder/src/api_open_annotations.dart';
import 'package:api_open_builder/src/api_open_models.dart';
import 'package:collection/collection.dart';

///Api Open Bulder main class
///
///
class ApiOpenBuilder {
  //singleton code
  static ApiOpenBuilder? _instance;

  final List<Tag> _tags = [];

  late final Info _info;
  late final List<Uri> _servers;

  ApiOpenBuilder._internal(this._info, this._servers);

  ///Create or get the singleton instance of the [ApiOpenBuilder]
  ///
  ///[info] is the [Info] object with the API information
  ///[servers] is a list of [Uri] with the servers of the API
  factory ApiOpenBuilder({required Info info, List<Uri> servers = const []}) {
    _instance ??= ApiOpenBuilder._internal(info, servers);
    return _instance!;
  }

  ///Add a list of [Tag] to the API
  void addTags(List<Tag> tags) {
    _tags.addAll(tags);
  }

  ///Get the OpenAPI specification as a JSON string
  String getOpenApiSpec({required List<Type> types}) {
    var paths = <String, dynamic>{};
    var schemas = <String, Map<String, dynamic>>{};
    for (var type in types) {
      var result = _processHandler(type);
      paths.addAll(result.paths);
      schemas.addAll(result.schemas);
    }

    var openApiSpec = {
      'openapi': '3.0.0',
      'info': _info.toMap(),
      'servers': _servers.map((e) => {'url': e.toString()}).toList(),
      if (_tags.isNotEmpty)
        'tags':
            _tags.map((e) => e.toMap()).toList(), // Si no hay etiquetas, omitir
      'paths': paths,
      'components': {'schemas': schemas}
    };

    return jsonEncode(openApiSpec);
  }

  Map<String, dynamic> _generateJsonSchema(
      Type type, Map<String, Map<String, dynamic>> schemas) {
    if (type == String) {
      return {'type': 'string'};
    }
    if (type == int) {
      return {'type': 'integer'};
    }
    if (type == double) {
      return {'type': 'number'};
    }
    if (type == bool) {
      return {'type': 'boolean'};
    }
    if (type == List) {
      return {
        'type': 'array',
        'items': {'type': 'string'}
      };
    }
    if (type == Map) {
      return {'type': 'object'};
    }
    if (type == DateTime) {
      return {'type': 'string', 'format': 'date-time'};
    }

    // Asume que cualquier otro tipo es un objeto complejo, usando referencia de esquema
    var typeName = type.toString();
    if (!schemas.containsKey(typeName) ||
        !(["int", "String", "double", "bool"].contains(typeName))) {
      schemas[typeName] = _generateComplexSchema(type);
    }
    return {'\$ref': '#/components/schemas/$typeName'};
  }

  Map<String, dynamic> _generateComplexSchema(Type type) {
    var mirror = reflectClass(type);
    var properties = <String, dynamic>{};

    mirror.declarations.forEach((symbol, declaration) {
      if (declaration is VariableMirror && !declaration.isStatic) {
        var fieldName = MirrorSystem.getName(symbol);
        var fieldType = declaration.type.reflectedType;
        var fieldSchema = <String, dynamic>{};
        var refType = reflectType(fieldType);
        // Manejar tipos especiales: List
        if (refType.isSubtypeOf(reflectType(List))) {
          var fieldType2 = refType.typeArguments.first;

          fieldSchema = {
            'type': 'array',
            'items': _generateJsonSchema(fieldType2.reflectedType, {})
          };
        }
        // Manejar tipos especiales: Map
        else if (fieldType is Map) {
          fieldSchema = {'type': 'object'};
        }
        // Manejar tipos complejos anidados
        else if (!fieldType.toString().startsWith('dart.')) {
          fieldSchema = _generateJsonSchema(
              fieldType, {}); // Recursivamente generar esquema
        }
        // Manejar otros tipos
        else {
          fieldSchema =
              _generateJsonSchema(fieldType, {}); // Generar esquema básico
        }

        // Agregar campo al esquema de propiedades
        properties[fieldName] = fieldSchema;
      }
    });

    return {
      'type': 'object',
      'properties': properties,
    };
  }

  ({Map<String, dynamic> paths, Map<String, Map<String, dynamic>> schemas})
      _processHandler(Type type) {
    var mirror = reflectClass(type);
    var handlerAnnotation =
        mirror.metadata.firstWhereOrNull((m) => m.reflectee is ApiHandler);

    if (handlerAnnotation == null) {
      throw ArgumentError(
          'Class ${MirrorSystem.getName(mirror.simpleName)} is not annotated with @Handler.');
    }

    var paths = <String, dynamic>{};
    var schemas = <String, Map<String, dynamic>>{};
    Map<String, dynamic> requestBody = {};
    final List<Tag> tags = handlerAnnotation.reflectee.tags;
    addTags(tags);
    String? handlerRoute = handlerAnnotation.reflectee.route;

    for (var method in mirror.declarations.values.whereType<MethodMirror>()) {
      var endpointAnnotation =
          method.metadata.firstWhereOrNull((m) => m.reflectee is Http);
      if (endpointAnnotation != null) {
        var endpoint = endpointAnnotation.reflectee as Http;
        var verb = endpoint.verb.name.toLowerCase();
        String? methodRoute = endpoint.route;

        var parameters = <Map<String, dynamic>>[];
        for (var param in method.parameters) {
          var paramAnnotation =
              param.metadata.firstWhereOrNull((m) => m.reflectee is Parameter);
          if (paramAnnotation != null) {
            var parameter = paramAnnotation.reflectee as Parameter;
            if (parameter.type == ParameterType.body) {
              schemas[param.type.reflectedType.toString()] =
                  _generateComplexSchema(param.type.reflectedType);
              requestBody = {
                //MirrorSystem.getName(param.simpleName),
                'description': MirrorSystem.getName(param.simpleName),
                'required': !param.isOptional,
                'content': {
                  _getcontentType(parameter.bodyType): {
                    'schema': {
                      (_isRef(parameter.bodyType) ? '\$ref' : 'type'): _isRef(
                              parameter.bodyType)
                          ? '#/components/schemas/${param.type.reflectedType.toString()}'
                          : _isRef(parameter.bodyType)
                              ? _generateJsonSchema(
                                  param.type.reflectedType, schemas)
                              : "string"
                    }
                  }
                },
              };
            } else {
              parameters.add({
                'name': MirrorSystem.getName(param.simpleName),
                'in': parameter.type.name.toLowerCase(),
                'required': !param.isOptional,
                'schema': {'type': _getOpenApiType(param.type.reflectedType)},
              });
            }
          }
        }

        var responseAnnotations =
            method.metadata.where((m) => m.reflectee is Response).toList();
        List<Response> responses =
            responseAnnotations.map((e) => e.reflectee as Response).toList();
        //Constructing path as joining the handler route and method route
        String path = "";
        //Class/Handler route
        // null or empty route means that the handler route is the class name
        if (handlerRoute == null || handlerRoute.isEmpty) {
          path = "/${MirrorSystem.getName(mirror.simpleName)}";
        } else {
          path = "/${handlerAnnotation.reflectee.route}";
        }
        //Method route
        if (methodRoute != null && methodRoute.isNotEmpty) {
          path = "$path/${endpoint.route}";
        } else if (methodRoute == null) {
          path = "$path/${MirrorSystem.getName(method.simpleName)}";
        }

        var pathParameters = parameters
            .where((param) =>
                param['in'] == ParameterType.path.name &&
                !path.contains(
                    "{${param['name']}}")) //Shall throw exception if path parameter is not found or isn't defined as path parameter
            .map((param) => "{${param['name']}}")
            .join('/');
        path += pathParameters.isEmpty ? '' : '/$pathParameters';

        paths[path] = {
          verb: {
            'tags': tags.map((e) => e.name).toList(),
            'summary': 'Summary for ${MirrorSystem.getName(method.simpleName)}',
            'operationId':
                "${MirrorSystem.getName(mirror.simpleName)}.${MirrorSystem.getName(method.simpleName)}",
            'parameters': parameters,
            if (requestBody.isNotEmpty) 'requestBody': requestBody,
            'responses': {
              for (var r in responses)
                '${r.statusCode}': {
                  'description': r.description,
                  'content': {
                    'application/json': {
                      'schema': _generateJsonSchema(r.responseType, schemas)
                    }
                  }
                }
            }
          }
        };
      }
    }

    return (paths: paths, schemas: schemas);
  }

  String _getcontentType(BodyType bodyType) {
    switch (bodyType) {
      case BodyType.json:
        return 'application/json';
      case BodyType.xml:
        return 'application/xml';
      case BodyType.form:
        return 'application/x-www-form-urlencoded';
      case BodyType.plain:
        return 'text/plain';
      default:
        return 'application/json';
    }
  }

  bool _isRef(BodyType bodyType) {
    switch (bodyType) {
      case BodyType.json:
      case BodyType.xml:
      case BodyType.form:
      case BodyType.plain:
        return true;
      default:
        return false;
    }
  }

  _getOpenApiType(Type reflectedType) {
    if (reflectedType == String) {
      return 'string';
    }
    if (reflectedType == int) {
      return 'integer';
    }
    if (reflectedType == double) {
      return 'number';
    }
    if (reflectedType == bool) {
      return 'boolean';
    }
    if (reflectedType == List) {
      return 'array';
    }
    if (reflectedType == Map) {
      return 'object';
    }
    if (reflectedType == DateTime) {
      return 'string';
    }
    return 'object';
  }
}
