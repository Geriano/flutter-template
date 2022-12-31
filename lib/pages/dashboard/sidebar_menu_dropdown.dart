import 'package:flutter/material.dart';
import 'package:template/pages/dashboard/sidebar_menu.dart';

class SidebarMenuDropdown extends StatefulWidget {
  const SidebarMenuDropdown({super.key, required this.leading, required this.title, required this.children});

  final Widget leading;
  final Widget title;
  final List<Widget> children;

  @override
  SidebarMenuDropdownState createState() => SidebarMenuDropdownState();
}

class SidebarMenuDropdownState extends State<SidebarMenuDropdown> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(
        right: 15,
      ),
      title: SidebarMenu(
        leading: widget.leading,
        title: widget.title,
      ),
      childrenPadding: const EdgeInsets.only(left: 40),
      children: widget.children,
    );
  }
}