import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/widget_drawer_tile.dart';
import 'package:flutter_food_delivery/pages/settings_page.dart';

class WidgetDrawer extends StatelessWidget {

  const WidgetDrawer({super.key, });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
children: [
//app logo
Padding(
  padding: const EdgeInsets.all(25.0),
  child: Icon(Icons.fastfood, size: 100, color: Theme.of(context).colorScheme.primary),
),
Divider(
  color: Theme.of(context).colorScheme.primary,
  thickness: 2,
),
//home list title
WidgetDrawerTile(
  icon: Icons.home, 
  text: 'Home', 
  onTap: () => Navigator.pop(context),),

WidgetDrawerTile(
  icon: Icons.settings, 
  text: 'Settings', 
  onTap: () { 
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
    },),

Spacer() ,

WidgetDrawerTile(icon: Icons.home, text: 'Logout', onTap: (){},),


//settings list title

//logout list title


],

        ),
      );

  }
}