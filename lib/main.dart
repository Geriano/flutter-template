import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/pages/dashboard/index.dart';
import 'package:template/providers/auth.dart';
import 'package:template/providers/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AuthProvider()),
        Provider(create: (context) => DashboardProvider()),

        ListenableProvider(create: (context) => AuthProvider()),
        ListenableProvider(create: (context) => DashboardProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => const Dashboard(),
        },
      ),
    );
  }
}
