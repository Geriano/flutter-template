import 'dart:convert';
import 'package:template/models/user.dart';
import 'package:template/requests/request.dart';
import 'package:template/responses/form_validation.dart';
import 'package:template/responses/login.dart';
import 'package:template/responses/response.dart';
import 'package:template/route.dart';

class LoginRequest extends Request {
  Future<Response> submit(String username, String password) async {
    final url = route(service: 'auth', route: 'login');

    try {
      final response = await post(url, body: { 'username': username, 'password': password });
      final success = LoginSuccessResponse.fromResponse(response);

      return success;
    } catch (e) {
      if (e is HttpUnprocessableEntityException) {
        return FormValidationExceptionResponse.fromResponse(e.response);
      } else {
        rethrow;
      }
    }
  }

  Future<Response> token(String token) async {
    final url = route(service: 'auth', route: 'user');

    try {
      final response = await get(url, headers: {
        'Authorization': 'Bearer $token',
      });

      return LoginSuccessResponse(
        token: token, 
        user: UserModel.fromJson(
          json.decode(response.body)
        )
      );
    } catch (e) {
      if (e is HttpUnauthenticatedException) {
        return LoginByTokenFailResponse();
      }

      rethrow;
    }
  }
}
