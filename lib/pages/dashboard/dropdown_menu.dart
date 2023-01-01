import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template/providers/dashboard.dart';

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
    var dashboard = context.watch<DashboardProvider>();

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey[800],
        padding: EdgeInsets.symmetric(horizontal: 15.h),
      ),
      onPressed: () {
        dashboard.toggleTopbarDropdown();
        
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      }, 
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