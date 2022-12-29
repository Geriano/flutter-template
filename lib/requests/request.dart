import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef JsonObjectResponse = Map<String, dynamic>;
typedef JsonListResponse = List<dynamic>;
typedef Headers = Map<String, String>;

enum Method {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE,
}

abstract class Request {
  static final Headers headers = {
    'Accept': 'application/json',
  };

  Headers _headers(Headers other) {
    Headers h = Headers.castFrom(headers);
    h.addAll(other);
    
    return h;
  }

  Future<http.Response> _execute({ required Method method, required Uri url, Object? body, Headers? headers, Encoding? encoding }) async {
    http.Response response;

    log('[${method.name}] $url', name: 'request');

    switch (method) {
      case Method.GET:
        response = await http.get(url, headers: _headers(headers ?? {}));
        break;
      case Method.POST:
        response = await http.post(url, headers: _headers(headers ?? {}), body: body, encoding: encoding);
        break;
      case Method.PUT:
        response = await http.put(url, headers: _headers(headers ?? {}), body: body, encoding: encoding);
        break;
      case Method.PATCH:
        response = await http.patch(url, headers: _headers(headers ?? {}), body: body, encoding: encoding);
        break;
      case Method.DELETE:
        response = await http.delete(url, headers: _headers(headers ?? {}), body: body, encoding: encoding);
        break;
      default:
        throw ErrorDescription('Unsuported request menthod [${method.name}]');
    }

    switch (response.statusCode) {
      case 401:
        throw HttpUnauthenticatedException(response: response);
      case 403:
        throw HttpUnauthorizeException(response: response);
      case 404:
        throw HttpNotFoundException(response: response);
      case 419:
        throw HttpPageExpiredException(response: response);
      case 422:
        throw HttpUnprocessableEntityException(response: response);
      case 500:
        throw HttpInternalServerErrorException(response: response);
    }

    return response;
  }

  Future<http.Response> get(Uri url, { Headers? headers }) => _execute(method: Method.GET, url: url, headers: headers);
  Future<http.Response> post(Uri url, { Headers? headers, Object? body, Encoding? encoding }) => _execute(method: Method.POST, url: url, headers: headers, body: body, encoding: encoding);
  Future<http.Response> put(Uri url, { Headers? headers, Object? body, Encoding? encoding }) => _execute(method: Method.POST, url: url, headers: headers, body: body, encoding: encoding);
  Future<http.Response> patch(Uri url, { Headers? headers, Object? body, Encoding? encoding }) => _execute(method: Method.POST, url: url, headers: headers, body: body, encoding: encoding);
  Future<http.Response> delete(Uri url, { Headers? headers, Object? body, Encoding? encoding }) => _execute(method: Method.POST, url: url, headers: headers, body: body, encoding: encoding);
}

class HttpErrorResponse extends ErrorDescription {
  HttpErrorResponse(super.message, { required this.response }) {
    request = response.request;
    code = response.statusCode;
    body = response.body;
    headers = response.headers;
  }

  final http.Response response;
  late final http.BaseRequest? request;
  late final int code;
  late final String body;
  late final Headers headers;
}

class HttpUnauthenticatedException extends HttpErrorResponse {
  HttpUnauthenticatedException({ required super.response }) : super('Unauthenticated');
}

class HttpUnauthorizeException extends HttpErrorResponse {
  HttpUnauthorizeException({ required super.response }) : super('Unauthorize');
}

class HttpNotFoundException extends HttpErrorResponse {
  HttpNotFoundException({ required super.response }) : super('Not Found');
}

class HttpPageExpiredException extends HttpErrorResponse {
  HttpPageExpiredException({ required super.response }) : super('Page Expired');
}

class HttpUnprocessableEntityException extends HttpErrorResponse {
  HttpUnprocessableEntityException({ required super.response }) : super('Unprocessable Entity');
}

class HttpInternalServerErrorException extends HttpErrorResponse {
  HttpInternalServerErrorException({ required super.response }) : super('Internal Server Error');
}
