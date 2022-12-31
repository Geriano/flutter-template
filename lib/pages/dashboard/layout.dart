

import 'package:flutter/material.dart';
import 'package:template/pages/dashboard/drawer.dart';
import 'package:template/pages/dashboard/dropdown.dart';
import 'package:template/pages/dashboard/topbar.dart';

class DashboardLayout extends StatefulWidget {
  DashboardLayout({super.key, required this.children});

  List<Widget> children;

  @override
  State<DashboardLayout> createState() => DashboardLayoutState();
}

class DashboardLayoutState extends State<DashboardLayout> {
  final scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        actions: [
          Topbar(scaffold: scaffold),
        ],
        leadingWidth: 0,
      ),
      backgroundColor: Colors.grey[300],
      drawer: const DashboardDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: widget.children,
                ),
              ),
            ),

            const TopbarDropdown(),
          ],
        ),
      ),
    );
  }
}