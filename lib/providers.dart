import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/providers/auth.dart';
import 'package:template/providers/dashboard.dart';
import 'package:template/providers/profile_general_information.dart';

final providers = [
  Provider(create: (BuildContext context) => AuthProvider()),
  Provider(create: (BuildContext context) => DashboardProvider()),
  Provider(create: (BuildContext context) => ProfileGeneralInformation()),

  ListenableProvider(create: (BuildContext context) => AuthProvider()),
  ListenableProvider(create: (BuildContext context) => DashboardProvider()),
  ListenableProvider(create: (BuildContext context) => ProfileGeneralInformation()),
];