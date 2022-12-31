import 'package:flutter/material.dart';
import 'package:template/theme.dart';

var loading = Scaffold(
  backgroundColor: Colors.grey.shade300,
  body: const Center(
    child: CircularProgressIndicator(),
  ),
);