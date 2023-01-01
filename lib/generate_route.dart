import 'package:flutter/material.dart';
import 'package:template/main.dart';
import 'package:template/models/auth.dart';
import 'package:template/pages/auth/login.dart';
import 'package:template/pages/loading.dart';
import 'package:template/providers/auth.dart';
import 'package:template/requests/login.dart';
import 'package:template/responses/login.dart';
import 'package:template/routes.dart';

Route<dynamic>? generateRoute(AuthProvider auth, RouteSettings settings) {
  if (auth.authenticated) {
    return MaterialPageRoute(
      builder: routes[settings.name]!,
    );
  }

  return MaterialPageRoute(
    builder: (context) => FutureBuilder(
      initialData: false,
      future: Future<String?>.delayed(
        const Duration(milliseconds: 1000), 
        () => localStorage!.getItem('token'),
      ),
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
              var response = snapshot.data as LoginSuccessResponse;
              return FutureBuilder(
                future: Future(() => auth.authenticated),
                builder: (context, snapshot) {
                  var route = routes[settings.name]!;

                  if (auth.authenticated) {
                    return route(context);
                  }
                  
                  return FutureBuilder(
                    future: Future(() => auth.futureAuthenticateFromModel(
                      AuthModel(response.token, response.user)
                    )),
                    builder: (context, snapshot) => routes[settings.name]!(context),
                  );
                }
              );
            }

            return const Login();
          },
        );
      },
    ),
  );
}