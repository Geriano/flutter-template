import 'package:flutter/material.dart';

class Topbar extends StatefulWidget {
  const Topbar({super.key, required this.scaffold, required this.children});

  final GlobalKey<ScaffoldState> scaffold;
  final List<Widget> children;

  @override
  TopbarState createState() => TopbarState();
}

class TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.children,
      ),
    );
  }
}