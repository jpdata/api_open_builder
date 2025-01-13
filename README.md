<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Open Builder Api V0.0.1 , for Dart backend development

WORK IN PROGRESS

This package is an atempt toto build a small framework to build Open Api compliant json that cab be used to build a gui like .Net's swagger

## Features

It a first try, a lot of work to do. But can work on simple Apis.

## Getting started

Just add this package to your project as usual.

## Usage

Of course there is an example in the `/example` folder.

And more details next:

First create an Open Api sepc documentation class:

```dart
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
```

then generate the open api json:

```dart
var openApi =
      apiOpenBuilder.getOpenApiSpec(types: [MyOtherHandler, MyHandler]);
```

Handlers (Controllers in .Net) are classes annotated like this:

```dart
@ApiHandler(tags: [Tag("MyHandler")])
class MyHandler {
  MyHandler();

  @Http(HttpVerb.get)
  @Response(200, "Return All", MyResponse)
  @Response(403, "No results", Null)
  void index(@Parameter(ParameterType.path) int limit) {
    //do what is needed here
  }

  @Http(HttpVerb.post)
  @Response(201, "Creates another handler", MyResponse)
  void create(@Parameter(ParameterType.query) int id,
      @Parameter(ParameterType.body) MyRequest service) {
        //create what needs to be created here
  }
}

```

## Annotations

### For endpoints

```@Http``` used as base for all endpoints annotations:

```@Http(HttpVerb.get, route: '{id}')```
but this can be written like this:
```@Http.get(route: '{id}')```
or shorter:
```@Get(route: '{id}')```

### For handlers

```dart
  @ApiHandler(
      ['recipes'],
      'CRUD recipes endpoint',
      'Basic actions on recipes',
      'recipes',
      'my-recipes')
```
