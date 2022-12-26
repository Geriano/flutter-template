import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  AuthInput({super.key, required this.controller, required this.label, this.obscureText, this.autofocus});

  final TextEditingController controller;
  final String label;
  final bool? obscureText;
  final bool? autofocus;

  @override
  AuthInputState createState() => AuthInputState();
}

class AuthInputState extends State<AuthInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        autocorrect: false,
        controller: widget.controller,
        obscureText: widget.obscureText != null && widget.obscureText == true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 2,
          ),
          hintText: widget.label,
          border: InputBorder.none,
        ),
        autofocus: widget.autofocus != null && widget.autofocus == true,
      ),
    );
  }
}