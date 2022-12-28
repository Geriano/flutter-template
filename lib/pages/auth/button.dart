import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  AuthButtonState createState() => AuthButtonState();

}

class AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 10.h),
      ),
      onPressed: widget.onPressed, 
      child: Text(widget.text),
    );
  }
}