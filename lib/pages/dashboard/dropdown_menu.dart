import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({super.key, required this.icon, required this.text, this.onPressed});

  final IconData icon;
  final String text;
  final void Function()? onPressed;

  @override
  DropdownMenuState createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey[800],
        padding: EdgeInsets.symmetric(horizontal: 15.h),
      ),
      onPressed: widget.onPressed, 
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(widget.icon),
            SizedBox(width: 5.h),
            Text(widget.text),
          ],
        ),
      ),
    );
  }
}