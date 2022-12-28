import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key, required this.child});

  final Widget child;

  @override
  AuthLayoutState createState() => AuthLayoutState();
}

class AuthLayoutState extends State<AuthLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 20.h,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}