import 'package:api_open_builder/src/mappers/uri_mapper.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'api_open_models.mapper.dart';


enum ParameterType { query, path, body, header }

enum HttpVerb { get, post, put, delete }

enum BodyType { json, xml, form, plain }

@MappableClass()
class Parameter with ParameterMappable {
  final ParameterType type;
  final BodyType bodyType;
  const Parameter(this.type, [this.bodyType = BodyType.json]);
}

@MappableClass()
class Externaldocs with ExternaldocsMappable {
  final String url;
  final String description;
  const Externaldocs([this.url = "0", this.description = ""]);
}

@MappableClass()
class Tag with TagMappable {
  final String name;
  final String description;
  final Externaldocs externalDocs;
  const Tag(this.name,
      [this.description = "", this.externalDocs = const Externaldocs("", "")]);
}
@MappableClass(includeCustomMappers: [UriMapper()])
class Info with InfoMappable {
  final String title;
  final String version;
  final String description;
  final License? license;
  final Contact? contact;
  final Uri? termsOfService;

  const Info(
      {this.title = "ApiOpen",
      this.version = "0.0.1",
      this.description = "ApiOpen description",
      this.termsOfService,
      this.contact,
      this.license});
}

@MappableClass()
class Contact with ContactMappable {
  final String name;
  final String email;

  const Contact({this.name = "", this.email = ""});
}

@MappableClass(includeCustomMappers: [UriMapper()])
class License with LicenseMappable {
  final String name;
  final Uri? url;

  const License({this.name = "", this.url});
}
