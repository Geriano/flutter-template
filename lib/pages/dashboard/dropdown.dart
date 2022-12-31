import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/providers/dashboard.dart';

class TopbarDropdown extends StatefulWidget {
  const TopbarDropdown({super.key, required this.children});

  final List<Widget> children;

  @override
  TopbarDropdownState createState() => TopbarDropdownState();
}

class TopbarDropdownState extends State<TopbarDropdown> {
  @override
  Widget build(BuildContext context) {
    var dashboard = context.watch<DashboardProvider>();
    var height = MediaQuery.of(context).size.height;
    
    return AnimatedPositioned(
      top: dashboard.topbarDropdown ? 5 : height * -1,
      right: 10,
      width: 200,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .1),
              offset: Offset(-3, 3),
            ),
          ],
        ),
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}