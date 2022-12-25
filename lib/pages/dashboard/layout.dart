

import 'package:flutter/material.dart';
import 'package:template/pages/dashboard/topbar.dart';

class DashboardLayout extends StatefulWidget {
  DashboardLayout({super.key, required this.children});

  List<Widget> children;

  @override
  State<DashboardLayout> createState() => DashboardLayoutState();
}

class DashboardLayoutState extends State<DashboardLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Topbar(),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: widget.children,
          ),
        ),
      ),
    );
  }
}