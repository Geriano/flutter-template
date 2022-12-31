import 'package:flutter/material.dart';
import 'package:template/pages/auth/forgot_password.dart';
import 'package:template/pages/auth/login.dart';
import 'package:template/pages/auth/register.dart';
import 'package:template/pages/dashboard/index.dart';

final routes = {
  '/': (BuildContext context) => const Dashboard(),
  '/login': (BuildContext context) => const Login(),
  '/register': (BuildContext context) => const Register(),
  '/forgot-password': (BuildContext context) => const ForgotPassword(),
};