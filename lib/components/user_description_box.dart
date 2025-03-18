import 'package:flutter/material.dart';

class WidgetDescriptionBox extends StatelessWidget {
  const WidgetDescriptionBox
({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            //delivery fee
        Column(
          children: [
            Text('\$10.00', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
            Text('Delivery Fee', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          ],
          ),
           Column(
              children: [
                Text('30-45 min', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                Text('Delivery Time', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
              ],
            ),
          ] 
        ),
      ),
    );
  }
}