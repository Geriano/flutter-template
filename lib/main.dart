import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:template/providers.dart';
import 'package:template/routes.dart';
import 'package:template/theme.dart';

final localStorage = LocalStorage('template');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Template',
          theme: theme,
          initialRoute: '/',
          routes: routes,
        ),
      ),
    );
  }
}
