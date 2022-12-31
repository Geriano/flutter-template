import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:template/generate_route.dart';
import 'package:template/providers.dart';
import 'package:template/providers/auth.dart';
import 'package:template/theme.dart';

LocalStorage? localStorage;

void main() {
  runApp(const Template());
}

class Template extends StatefulWidget {
  const Template({super.key});

  @override
  State<Template> createState() => TemplateState();
}

class TemplateState extends State<Template> {
  @override
  void initState() {
    localStorage = LocalStorage('template_local_storage');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          var auth = context.watch<AuthProvider>();
          
          return MaterialApp(
            title: 'Template',
            theme: theme,
            initialRoute: '/',
            onGenerateRoute: (settings) => auth.authenticated ? null : generateRoute(auth, settings,),
          );
        },
      ),
    );
  }
}
