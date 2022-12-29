import 'package:http/http.dart' as http;

abstract class Response {
  static Response fromResponse(http.Response response) {
    throw UnimplementedError();
  }
}