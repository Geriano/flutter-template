import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:template/components/text_link.dart';
import 'package:template/pages/auth/button.dart';
import 'package:template/pages/auth/card.dart';
import 'package:template/pages/auth/input.dart';
import 'package:template/pages/auth/layout.dart';
import 'package:template/providers/auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  void login(AuthProvider auth) {
    final body = {
      'email': email.text,
    };

    print(body);
  }

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>();
    
    return AuthLayout(
      child: AuthCard(
        header: Text('Forgot password', style: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w800,
        )),
        body: Column(
          children: [
            AuthInput(controller: email, label: 'Email', autofocus: true),
            AuthButton(onPressed: () => login(auth), text: 'Send reset password mail'),
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
                const Text("Doesn't have account?"),
                SizedBox(width: 5.h),
                TextLink(onPressed: () => Navigator.pushNamed(context, '/register'), text: 'register'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
