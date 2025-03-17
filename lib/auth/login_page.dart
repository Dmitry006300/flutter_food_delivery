import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/widget_signIn_text_field.dart';
import 'package:flutter_food_delivery/components/widget_singIn_button.dart';
import 'package:flutter_food_delivery/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

   LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
     //TextEditingController
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 void login () {
  /*
  fill out authentication here
  */
  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
        Icon( Icons.lock_open_rounded, size: 100, color: Theme.of(context).colorScheme.inversePrimary, 
        ),
        const SizedBox(height: 25),
            //message
        Text (
          "Food Delivery",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
        ),
             const SizedBox(height: 25),

            //email
             SignInTextFieldWidget(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
             ),
             const SizedBox(height: 25),

            //password
                   SignInTextFieldWidget(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
             ),
             const SizedBox(height: 25),

            //login button
        WidgetSignInButton(
          onTap: login,
          text: 'Sign In',
        ),

             const SizedBox(height: 25),
            //not a member? register here
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not a member? ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            GestureDetector(
              onTap: widget.onTap,
                child: Text(
                  "Register now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }

}