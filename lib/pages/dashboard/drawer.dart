import 'package:flutter/material.dart';
import 'package:template/pages/dashboard/sidebar_menu.dart';
import 'package:template/pages/dashboard/sidebar_menu_dropdown.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  DashboardDrawerState createState() => DashboardDrawerState();
}

class DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SidebarMenu(
            leading: const Icon(Icons.computer), 
            title: const Text('Dashboard'), 
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          SidebarMenuDropdown(
            leading: const Icon(Icons.people), 
            title: const Text('Builtin'), 
            children: [
              SidebarMenu(
                leading: const Icon(Icons.key),
                title: const Text('Permission'),
                onTap: () => Navigator.pushNamed(context, '/superuser/permission'),
              ),
              SidebarMenu(
                leading: const Icon(Icons.add_moderator),
                title: const Text('Role'),
                onTap: () => Navigator.pushNamed(context, '/superuser/roles'),
              ),
              SidebarMenu(
                leading: const Icon(Icons.group),
                title: const Text('User'),
                onTap: () => Navigator.pushNamed(context, '/superuser/user'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
