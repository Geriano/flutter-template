import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template/components/text_link.dart';
import 'package:template/models/auth.dart';
import 'package:template/pages/auth/button.dart';
import 'package:template/pages/auth/card.dart';
import 'package:template/pages/auth/input.dart';
import 'package:template/pages/auth/layout.dart';
import 'package:template/providers/auth.dart';
import 'package:template/requests/login.dart';
import 'package:template/requests/request.dart';
import 'package:template/responses/form_validation.dart';
import 'package:template/responses/login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController username = TextEditingController(text: 'su');
  TextEditingController password = TextEditingController(text: 'password');
  final Map<String, String?> errors = {
    'username': null,
    'password': null,
  };

  void login(AuthProvider auth) async {
    setState(() {
      errors['username'] = null;
      errors['password'] = null;
    });

    try {
      final response = await LoginRequest().submit(username.text, password.text);

      if (response is FormValidationExceptionResponse) {
        for (var field in response.errors.keys) {
          errors[field] = response.errors[field];
        }

        setState(() {
          password.clear();
        });
      } else if (response is LoginSuccessResponse) {
        auth.authenticateFromModel(AuthModel(
          response.token, 
          response.user,
        ));
      }
    } catch (e) {
      if (e is HttpUnauthenticatedException) {
        setState(() {
          errors['password'] = 'Wrong password';
        });
      } else {
        rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    
    return AuthLayout(
      child: AuthCard(
        header: Text('Login', style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w800,
        )),
        body: Column(
          children: [
            AuthInput(
              controller: username, 
              label: 'Username', 
              autofocus: true,
              error: errors['username'],
            ),
            AuthInput(
              controller: password, 
              label: 'Password', 
              obscureText: true,
              error: errors['password'],
            ),
            AuthButton(
              onPressed: () => login(auth), 
              text: 'Login',
            ),
          ],
        ),
        footer: Column(
          children: [
            Row(
              children: [
                const Text("Doesn't have account?"),
                SizedBox(width: 5.h),
                TextLink(onPressed: () => Navigator.pushNamed(context, '/register'), text: 'register'),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                const Text("Forgot your password?"),
                SizedBox(width: 5.h),
                TextLink(onPressed: () => Navigator.pushNamed(context, '/forgot-password'), text: 'reset password'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
