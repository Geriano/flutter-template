import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  late AuthProvider auth;

  void login() {
    print(auth);
  }

  @override
  Widget build(BuildContext context) {
    auth = context.watch<AuthProvider>();
    var width = MediaQuery.of(context).size.width;

    return AuthLayout(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: AuthCard(
          header: const Text('Login', style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
          )),
          body: Column(
            children: [
              AuthInput(controller: username, label: 'Username', autofocus: true),
              const SizedBox(height: 10),
              AuthInput(controller: password, label: 'Password', obscureText: true),
              const SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 10),
                ),
                onPressed: login, 
                child: const Text('Login')
              ),
            ],
          ),
          footer: Column(
            children: [
              Row(
                children: [
                  const Text("Doesn't have account?"),
                  const SizedBox(width: 5),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {}, 
                    child: const Text('register'),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text("Forgot your password?"),
                  const SizedBox(width: 5),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {}, 
                    child: const Text('reset password'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
