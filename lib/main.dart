import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:template/models/auth.dart';
import 'package:template/pages/loading.dart';
import 'package:template/providers.dart';
import 'package:template/providers/auth.dart';
import 'package:template/requests/login.dart';
import 'package:template/requests/request.dart';
import 'package:template/responses/login.dart';
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
        builder: (context, child) {
          var auth = context.watch<AuthProvider>();

          return FutureBuilder(
            initialData: false,
            future: localStorage.ready,
            builder: (context, snapshot) {
              var data = snapshot.data as bool;

              if (auth.authenticated) {
                return child!;
              }

              if (data) {
                return FutureBuilder(
                  future: Future(() => localStorage.getItem('token')),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data is String) {  
                      var token = snapshot.data as String;
                      return FutureBuilder(
                        future: LoginRequest().token(token),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return loading;
                          }

                          var response = snapshot.data as LoginSuccessResponse;

                          return FutureBuilder(
                            future: Future<AuthModel>.delayed(
                              const Duration(milliseconds: 300),
                              () => auth.authenticateFromModel(
                                AuthModel(
                                  response.token,
                                  response.user, 
                                ),
                              ),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return child!;
                              }

                              return loading;
                            },
                          );
                        },
                      );
                    }

                    return child!;
                  },
                );
              } else {
                return loading;
              }
            },
          );
        },
        child: MaterialApp(
          title: 'Template',
          theme: theme,
          initialRoute: '/',
          routes: routes,
        ),
      ),
    );
  }
}
