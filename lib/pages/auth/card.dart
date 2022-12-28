import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/theme.dart';

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
    var width = 300.sp;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.sp),
        ),
        color: theme.cardColor,
      ),
      child: Column(
        children: [
          if (widget.header != null) Container(
            padding: EdgeInsets.only(
              top: 30.h,
              right: 10.h,
              left: 10.h,
              bottom: 20.h,
            ),
            child: widget.header,
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 20.h,
            ),
            width: width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: widget.header != null ? 1 : 0),
                bottom: BorderSide(color: Colors.grey.shade300, width: widget.footer != null ? 1 : 0),
              ),
            ),
            child: widget.body,
          ),

          if (widget.footer != null) Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 20.h,
            ),
            child: widget.footer,
          ),
        ],
      ),
    );
  }
}