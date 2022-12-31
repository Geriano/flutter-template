import 'dart:convert';

import 'package:template/main.dart';
import 'package:template/requests/request.dart';
import 'package:template/responses/logout.dart';
import 'package:template/responses/response.dart';
import 'package:template/route.dart';

class LogoutRequest extends Request {
  Future<Response> execute() async {
    final url = route(service: 'auth', route: 'logout');
    Response result;
    try {
      final response = await delete(url);
      JsonObjectResponse data = json.decode(response.body);

      result = LogoutSuccessResponse(message: data['message']);
    } catch (e) {
      if (e is HttpUnauthorizeException) {
        result = LogoutSuccessResponse(message: 'Logout Success');
      } else {
        rethrow;
      }
    } finally {
      Request.headers.remove('Authorization');
      await localStorage!.deleteItem('token');
    }

    return result;
  }
}