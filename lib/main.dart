import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/auth/auth_gate.dart';
import 'package:flutter_food_delivery/auth/login_or_register.dart';
import 'package:flutter_food_delivery/database/restaurant_data.dart';
import 'package:flutter_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart'; 

void  main()  async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()), //Theme

      ChangeNotifierProvider( create: (context) => Restaurant()), //Restaurant
    ],
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
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData, //Theme
    );
  }
}
