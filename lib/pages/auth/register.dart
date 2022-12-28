import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template/components/text_link.dart';
import 'package:template/pages/auth/button.dart';
import 'package:template/pages/auth/card.dart';
import 'package:template/pages/auth/input.dart';
import 'package:template/pages/auth/layout.dart';
import 'package:template/providers/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  void register(AuthProvider auth) {
    final body = {
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'password_confirmation': passwordConfirmation.text,
    };

    print(body);
  }

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    
    return AuthLayout(
      child: AuthCard(
        header: Text('Register', style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.w800,
        )),
        body: Column(
          children: [
            AuthInput(controller: name, label: 'Name', autofocus: true),
            AuthInput(controller: email, label: 'Email'),
            AuthInput(controller: username, label: 'Username'),
            AuthInput(controller: password, label: 'Password', obscureText: true),
            AuthInput(controller: passwordConfirmation, label: 'Password confirmation', obscureText: true),
            AuthButton(onPressed: () => register(auth), text: 'Register'),
          ],
        ),
        footer: Column(
          children: [
            Row(
              children: [
                const Text("Already have account?"),
                SizedBox(width: 5.h),
                TextLink(onPressed: () => Navigator.pushNamed(context, '/login'), text: 'login'),
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
