import 'package:provider/provider.dart' show Consumer, WatchContext;
import 'package:flutter/material.dart';
import 'package:template/providers/dashboard.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    var dashboard = context.watch<DashboardProvider>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: dashboard.toggleSidebar, 
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
    
          IconButton(
            onPressed: dashboard.toggleTopbarDropdown, 
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ],
      ),
    );
  }
}