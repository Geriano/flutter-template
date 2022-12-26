import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  AuthCard({super.key, this.header, required this.body, this.footer});

  Widget? header;
  final Widget body;
  Widget? footer;

  @override
  AuthCardState createState() => AuthCardState();
}

class AuthCardState extends State<AuthCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          if (widget.header != null) Container(
            padding: const EdgeInsets.only(
              top: 30,
              right: 10,
              left: 10,
              bottom: 20,
            ),
            child: widget.header,
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: widget.header != null ? 1 : 0),
                bottom: BorderSide(color: Colors.grey.shade300, width: widget.footer != null ? 1 : 0),
              ),
              color: Colors.grey.shade100,
            ),
            child: widget.body,
          ),

          if (widget.footer != null) Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: widget.footer,
          ),
        ],
      ),
    );
  }
}