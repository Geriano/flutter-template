import 'dart:convert';

import 'package:template/requests/request.dart';
import 'package:template/responses/logout.dart';
import 'package:template/responses/response.dart';
import 'package:template/route.dart';

class Logout extends Request {
  Future<Response> execute() async {
    final url = route(service: 'auth', route: 'logout');
    final response = await delete(url);
    JsonObjectResponse data = json.decode(response.body);

    return LogoutSuccessResponse(message: data['message']);
  }
}