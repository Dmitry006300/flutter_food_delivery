import 'package:flutter/material.dart';

class WidgetSignInButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const WidgetSignInButton
({super.key,
    required this.onTap,
    required this.text,
    }); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
      ),
    );
  }
}