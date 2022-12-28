import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template/components/text_link.dart';
import 'package:template/pages/auth/button.dart';
import 'package:template/pages/auth/card.dart';
import 'package:template/pages/auth/input.dart';
import 'package:template/pages/auth/layout.dart';
import 'package:template/providers/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(AuthProvider auth) {
    print(auth);
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
            AuthInput(controller: username, label: 'Username', autofocus: true),
            AuthInput(controller: password, label: 'Password', obscureText: true),
            AuthButton(onPressed: () => login(auth), text: 'Login'),
          ],
        ),
        footer: Column(
          children: [
            Row(
              children: [
                const Text("Doesn't have account?"),
                SizedBox(width: 5.h),
                TextLink(onPressed: () {}, text: 'register'),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                const Text("Forgot your password?"),
                SizedBox(width: 5.h),
                TextLink(onPressed: () {}, text: 'reset password'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
