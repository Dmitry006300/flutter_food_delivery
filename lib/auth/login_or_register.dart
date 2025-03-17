import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/auth/login_page.dart';
import 'package:flutter_food_delivery/auth/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void toggleView() {
    setState(() => showLoginPage = !showLoginPage);
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggleView);
    } else {
      return RegisterPage(onTap: toggleView);
    }
  }
}
