import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/auth/login_or_register.dart';
import 'package:flutter_food_delivery/auth/login_page.dart';
import 'package:flutter_food_delivery/auth/register_page.dart';
import 'package:flutter_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), //Theme
    child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData, //Theme
    );
  }
}
