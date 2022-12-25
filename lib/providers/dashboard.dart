import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  final Map<String, bool> _open = {
    'topbarDropdown': false,
    'sidebar': false,
  };

  String page = 'dashboard';

  bool get topbarDropdown => _open['topbarDropdown']!;
  bool get sidebar => _open['sidebar']!;

  void _toggle(String type) {
    _open[type] = ! _open[type]!;

    notifyListeners();
  }

  void toggleTopbarDropdown() => _toggle('topbarDropdown');
  void toggleSidebar() => _toggle('sidebar');
}