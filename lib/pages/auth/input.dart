import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/theme.dart';

class AuthInput extends StatefulWidget {
  const AuthInput({
    super.key, 
    required this.controller, 
    required this.label, 
    this.obscureText = false, 
    this.autofocus = false,
    this.error,
  });

  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final bool autofocus;
  final String? error;

  @override
  AuthInputState createState() => AuthInputState();
}

class AuthInputState extends State<AuthInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.error == null ? Colors.grey.shade300 : Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.h),
            ),
            color: theme.cardTheme.color,
          ),
          child: TextFormField(
            autocorrect: false,
            controller: widget.controller,
            autofocus: widget.autofocus,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 2.h,
              ),
              hintText: widget.label,
              border: InputBorder.none,
            ),
          ),
        ),
        if (widget.error != null) Container(
          margin: EdgeInsets.only(
            bottom: 7.h,
          ),
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.error!, 
            style: TextStyle(
              color: Colors.red,
              fontSize: 11.sp,
            ),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}