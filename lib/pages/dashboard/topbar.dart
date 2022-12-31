import 'package:provider/provider.dart' show Consumer, WatchContext;
import 'package:flutter/material.dart';
import 'package:template/providers/dashboard.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key, required this.scaffold});

  final GlobalKey<ScaffoldState> scaffold;

  @override
  Widget build(BuildContext context) {
    var dashboard = context.watch<DashboardProvider>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => scaffold.currentState!.openDrawer(), 
            icon: const Icon(Icons.menu, color: Colors.white),
          ),

          Text(dashboard.page[0].toUpperCase() + dashboard.page.substring(1), style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          )),
    
          IconButton(
            onPressed: dashboard.toggleTopbarDropdown, 
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ],
      ),
    );
  }
}