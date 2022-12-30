import 'package:flutter/material.dart';
import 'package:template/main.dart';
import 'package:template/models/auth.dart';
import 'package:template/models/user.dart';
import 'package:template/requests/request.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  String? _token;

  bool get authenticated => _user != null;
  UserModel? get user => _user;
  String? get token => _token;

  AuthModel authenticateFromModel(AuthModel auth) {
    _user = auth.user;
    _token = auth.token;

    notifyListeners();

    return auth;
  }

  Future<AuthModel> futureAuthenticateFromModel(AuthModel auth) async {
    _user = auth.user;
    _token = auth.token;

    await Future.delayed(const Duration(seconds: 1), notifyListeners);
    
    return auth;
  }
}