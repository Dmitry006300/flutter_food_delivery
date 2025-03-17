import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
    
              border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text
                Text('Dark Mode', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold),),
            
             //Switch
                Switch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  onChanged: (value) => 
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
              
                ),  

              ],
            ),
          ),
        ],
      ),
    );
  }
}