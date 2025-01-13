//@Annotation
import 'package:api_open_builder/src/api_open_models.dart';

final class Http {
  final HttpVerb verb;
  final String? route;

  // Constructor constante y privado para limitar el uso
  const Http._(this.verb, {this.route});

  // Factory constante para crear instancias como anotación
  @pragma('dart2js:noInline')
  const factory Http(HttpVerb verb, {String? route}) = Http._;

  @pragma('dart2js:noInline')
  //a constructor that takes a route and defaults verb to get
  const Http.get({String? route}) : this._(HttpVerb.get, route: route);

  @pragma('dart2js:noInline')
  //a constructor that takes a route and defaults verb to post
  const Http.post({String? route}) : this._(HttpVerb.post, route: route);

  @pragma('dart2js:noInline')
  //a constructor that takes a route and defaults verb to put
  const Http.put({String? route}) : this._(HttpVerb.put, route: route);

  @pragma('dart2js:noInline')
  //a constructor that takes a route and defaults verb to delete
  const Http.delete({String? route}) : this._(HttpVerb.delete, route: route);
}

final class Get extends Http {
  const Get({String? route}) : super._(HttpVerb.get, route: route);
}

final class Post extends Http {
  const Post({String? route}) : super._(HttpVerb.post, route: route);
}

final class Put extends Http {
  const Put({String? route}) : super._(HttpVerb.put, route: route);
}

final class Delete extends Http {
  const Delete({String? route}) : super._(HttpVerb.delete, route: route);
}

//@Annotation
final class ApiHandler {
  final List<Tag> tags;
  final String description;
  final String summary;
  final String operationId;
  final String? route;
  const ApiHandler._(
      {this.tags = const [],
      this.description = "",
      this.summary = "",
      this.operationId = "",
      this.route});

  @pragma('dart2js:noInline')
  const factory ApiHandler(
      {List<Tag> tags,
      String description,
      String summary,
      String operationId,
      String? route}) = ApiHandler._;
}

//@Annotation
final class Response {
  final int statusCode;
  final String description;
  final Type responseType;

  //const Response(this.statusCode, this.description, this.responseType);

  // Constructor constante y privado para limitar el uso
  const Response._(this.statusCode, this.description, this.responseType);

  // Factory constante para crear instancias como anotación
  @pragma('dart2js:noInline')
  const factory Response(
      int statusCode, String description, Type responseType) = Response._;
}
