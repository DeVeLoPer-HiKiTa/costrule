import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart' as shelf;

void main() async {
  var handler = const shelf.Pipeline()
      .addMiddleware((_) => htmlHandler)
      .addHandler(unknownPath);

  var server = await shelf_io.serve(handler, 'localhost', 8080);

  server.autoCompress = true;
}

shelf.Response htmlHandler(shelf.Request request) {
  return shelf.Response.ok('this is probably html)))');
}

shelf.Response unknownPath(_) {
  return shelf.Response.notFound(
      'I can not find some content for this path((((((((');
}
