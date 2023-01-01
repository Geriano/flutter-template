import 'package:flutter/material.dart';

class ProfileGeneralInformation extends ChangeNotifier {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _username = TextEditingController();

  Map<String, String?> errors = {
    'photo': null,
    'name': null,
    'username': null,
    'email': null,
  };

  TextEditingController get nameController => _name;
  TextEditingController get emailController => _name;
  TextEditingController get usernameController => _name;

  String get name => _name.text;
  String get email => _email.text;
  String get username => _username.text;

  set name(String value) {
    _name.text = value;
    notifyListeners();
  }
  set email(String value) {
    _email.text = value;
    notifyListeners();
  }
  set username(String value) {
    _username.text = value;
    notifyListeners();
  }
}