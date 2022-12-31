import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:template/pages/auth/login.dart';
import 'package:template/pages/dashboard/index.dart';
import 'package:template/pages/loading.dart';
import 'package:template/providers.dart';
import 'package:template/providers/auth.dart';
import 'package:template/requests/login.dart';
import 'package:template/responses/login.dart';
import 'package:template/routes.dart';
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
            onGenerateRoute: (settings) {
              if (auth.authenticated) {
                return MaterialPageRoute(
                  builder: routes[settings.name]!,
                );
              }

              return MaterialPageRoute(
                builder: (context) => FutureBuilder(
                  initialData: false,
                  future: Future<String?>.delayed(const Duration(milliseconds: 1000), () => localStorage!.getItem('token')),
                  builder: (context, snapshot) {
                    if (snapshot.data == false) {
                      return loading;
                    }

                    if (snapshot.data == null) {
                      return const Login();
                    }
                    
                    return FutureBuilder(
                      future: LoginRequest().token(snapshot.data as String),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return loading;
                        }

                        if (snapshot.data is LoginSuccessResponse) {
                          return const Dashboard();
                        }

                        return const Login();
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
