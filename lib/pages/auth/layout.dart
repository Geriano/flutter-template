import 'package:flutter/material.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key, required this.child});

  final Widget child;

  AuthLayoutState createState() => AuthLayoutState();
}

class AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}