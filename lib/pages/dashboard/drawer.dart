import 'package:flutter/material.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key, required this.children});

  final List<Widget> children;

  @override
  DashboardDrawerState createState() => DashboardDrawerState();
}

class DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: widget.children,
      ),
    );
  }
}
