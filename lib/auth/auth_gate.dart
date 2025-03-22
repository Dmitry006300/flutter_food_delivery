import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/auth/login_or_register.dart';
import 'package:flutter_food_delivery/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //loggedIn
          if (snapshot.hasData) {
            return const HomePage();
          }
          //NOT logged
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}