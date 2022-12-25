import 'package:flutter/material.dart';
import 'package:template/models/auth.dart';
import 'package:template/models/user.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  String? _token;

  bool get authenticated => _user != null;
  UserModel? get user => _user;
  String? get token => _token;

  void authenticateFromModel(AuthModel auth) {
    _user = auth.user;
    _token = auth.token;

    notifyListeners();
  }
}