import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/widget_signIn_text_field.dart';
import 'package:flutter_food_delivery/components/widget_singIn_button.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

   RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
     //TextEditingController
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
          "Let's create an account for you",
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

//confirmPassword
SignInTextFieldWidget(
  controller: confirmPasswordController, 
  hintText: 'Confirm password', 
  obscureText: true,),

             const SizedBox(height: 25),
            //SignUp button
        WidgetSignInButton(
          onTap: () {
          //  print('Email: ${emailController.text}');
         //   print('Password: ${passwordController.text}');
        //    print('confirmPassword: ${confirmPasswordController.text}');
          },
          text: 'Sign Up',
        ),

             const SizedBox(height: 25),
            //not a member? register here
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already a member? ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            GestureDetector(
              onTap: widget.onTap,
                child: Text(
                  "Login now",
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