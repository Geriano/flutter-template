import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key, this.leading, required this.title, this.onTap});

  final Widget? leading;
  final Widget title;
  final void Function()? onTap;

  @override
  SidebarMenuState createState() => SidebarMenuState();
}

class SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: .5.sp,
      leading: widget.leading,
      title: widget.title,
      onTap: widget.onTap,
    );
  }
}