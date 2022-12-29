import 'dart:convert';
import 'package:template/models/user.dart';
import 'package:template/requests/request.dart';
import 'package:template/responses/response.dart';
import 'package:http/http.dart' as http;

class LoginSuccessResponse extends Response {
  LoginSuccessResponse({ required this.token, required this.user });

  final String token;
  final UserModel user;

  static LoginSuccessResponse fromResponse(http.Response response) => fromJson(json.decode(response.body) as JsonObjectResponse);
  static LoginSuccessResponse fromJson(JsonObjectResponse json) {
    final token = json['token'].toString();
    final user = json['user'] as JsonObjectResponse;

    return LoginSuccessResponse(
      token: token, 
      user: UserModel.fromJson(user),
    );
  }
}