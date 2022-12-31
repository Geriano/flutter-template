import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/pages/dashboard/drawer.dart';
import 'package:template/pages/dashboard/dropdown.dart';
import 'package:template/pages/dashboard/dropdown_menu.dart';
import 'package:template/pages/dashboard/sidebar_menu.dart';
import 'package:template/pages/dashboard/sidebar_menu_dropdown.dart';
import 'package:template/pages/dashboard/topbar.dart';
import 'package:template/providers/dashboard.dart';
import 'package:template/requests/logout.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key, required this.children});

  final List<Widget> children;

  @override
  State<DashboardLayout> createState() => DashboardLayoutState();
}

class DashboardLayoutState extends State<DashboardLayout> {
  final scaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var dashboard = context.watch<DashboardProvider>();
    
    return Scaffold(
      key: scaffold,
      appBar: AppBar(
        actions: [
          Topbar(
            scaffold: scaffold,
            children: [
              IconButton(
                onPressed: () => scaffold.currentState!.openDrawer(), 
                icon: const Icon(Icons.menu, color: Colors.white),
              ),

              Text(dashboard.page[0].toUpperCase() + dashboard.page.substring(1), style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              )),
        
              IconButton(
                onPressed: dashboard.toggleTopbarDropdown, 
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              ),
            ],
          ),
        ],
        leadingWidth: 0,
      ),
      backgroundColor: Colors.grey[300],
      drawer: DashboardDrawer(
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
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10.h),
              child: SingleChildScrollView(
                child: Column(
                  children: widget.children,
                ),
              ),
            ),

            TopbarDropdown(
              children: [
                DropdownMenu(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  icon: Icons.account_circle, 
                  text: 'Profile',
                ),
                DropdownMenu(
                  onPressed: () {
                    LogoutRequest().execute()
                                    .whenComplete(() async {
                                      Navigator.pushNamed(context, '/login');
                                    });
                  },
                  icon: Icons.logout, 
                  text: 'Logout',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}