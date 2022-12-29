import 'dart:convert';

import 'package:template/responses/response.dart';
import 'package:http/http.dart' as http;

class FormValidationExceptionResponse extends Response {
  FormValidationExceptionResponse(this.errors);

  final Map<String, String> errors;

  static FormValidationExceptionResponse fromResponse(http.Response response) => fromJson(json.decode(response.body)['errors'] as List<dynamic>);
  static FormValidationExceptionResponse fromJson(List<dynamic> json) {
    Map<String, String> errors = {};

    for (var error in json) {
      final e = error as Map<String, dynamic>;
      errors[e['field'].toString()] = e['message'].toString();
    }

    return FormValidationExceptionResponse(errors);
  }
}