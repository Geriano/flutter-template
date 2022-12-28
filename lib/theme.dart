import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.blue,
  backgroundColor: Colors.grey.shade300,
  scaffoldBackgroundColor: Colors.grey.shade300,
  cardTheme: CardTheme(
    color: Colors.grey.shade100,
    shadowColor: Colors.grey.shade700,
  ),
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.blue.shade600,
      secondary: Colors.grey.shade700,
      onSecondary: Colors.grey.shade800,
      error: Colors.red,
      onError: Colors.red.shade600,
      background: Colors.transparent,
      onBackground: Colors.transparent,
      surface: Colors.transparent,
      onSurface: Colors.transparent,
    ),
  ),
);