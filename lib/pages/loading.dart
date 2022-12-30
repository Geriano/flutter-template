import 'package:flutter/material.dart';
import 'package:template/theme.dart';

var loading = MaterialApp(
  title: 'Template',
  theme: theme,
  initialRoute: '/loading',
  routes: {
    '/loading':(context) => Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
  },
);