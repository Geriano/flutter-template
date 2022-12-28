import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/pages/auth/login.dart';
import 'package:template/pages/auth/register.dart';
import 'package:template/pages/dashboard/index.dart';
import 'package:template/providers/auth.dart';

final routes = {
  '/': (BuildContext context) {
    var auth = context.watch<AuthProvider>();

    return auth.authenticated ? const Dashboard() : const Login();
  },
  '/login': (BuildContext context) {
    var auth = context.watch<AuthProvider>();

    return auth.authenticated ? const Dashboard() : const Login();
  },
  '/register': (BuildContext context) {
    var auth = context.watch<AuthProvider>();

    return auth.authenticated ? const Dashboard() : const Register();
  },
};