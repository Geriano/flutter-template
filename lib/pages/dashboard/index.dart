import 'package:flutter/material.dart';
import 'package:template/pages/dashboard/layout.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var i = 0; i < 100; i++) {
      children.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        child: Center(child: Text('No $i')),
      ));
    }

    return DashboardLayout(
      children: children,
    );
  }
}