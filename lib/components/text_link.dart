import 'package:flutter/material.dart';

class TextLink extends StatefulWidget {
  const TextLink({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  TextLinkState createState() => TextLinkState();
}

class TextLinkState extends State<TextLink> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: widget.onPressed, 
      child: Text(widget.text),
    );
  }
}
