import 'package:api_open_builder/api_open_builder.dart';

@ApiHandler(tags: [Tag("MyOtherHandler")])
class MyOtherHandler {
  final String name;
  final String description;
  final int version;
  final String basePath;
  final bool active;
  final List<String> apis;

  MyOtherHandler({
    required this.name,
    required this.description,
    required this.version,
    required this.basePath,
    required this.active,
    required this.apis,
  });

  @Http(HttpVerb.post, route: "create/{id}/solo")
  @Response(201, "Creates another handler", MyResponse)
  void create(@Parameter(ParameterType.path) int id,
      @Parameter(ParameterType.body) MyRequest service) {}
}

@ApiHandler(tags: [Tag("MyHandler")])
class MyHandler {
  MyHandler();

  @Http(HttpVerb.get)
  @Response(200, "Return All", MyResponse)
  @Response(403, "No results", Null)
  void index(@Parameter(ParameterType.path) int limit) {}

  @Http(HttpVerb.post)
  @Response(201, "Creates another handler", MyResponse)
  void create(@Parameter(ParameterType.query) int id,
      @Parameter(ParameterType.body) MyRequest service) {}
}

class MyResponse {
  final String message;
  final DateTime date = DateTime.now();

  MyResponse(this.message);
}

class MyRequest {
  final String message;
  final DateTime date = DateTime.now();

  MyRequest(this.message);
}

void main() {
  var apiOpenBuilder = ApiOpenBuilder(
      info: Info(
          title: "My API",
          description: "My API description",
          version: "1.0.0",
          termsOfService: Uri.tryParse("http://example.com/terms"),
          contact: Contact(
            name: "My Name",
            email: "",
          ),
          license: License(
            name: "Apache 2.0",
            url: Uri.tryParse("http://www.apache.org/licenses/LICENSE-2.0"),
          )),
      servers: [Uri.tryParse("http://localhost:8080")!]);
  var openApi =
      apiOpenBuilder.getOpenApiSpec(types: [MyOtherHandler, MyHandler]);
  print(openApi);
}
