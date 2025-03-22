import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/database/restaurant_data.dart';
import 'package:provider/provider.dart';

class UserCurrentLocation extends StatelessWidget {
  UserCurrentLocation({super.key});
  final textController = TextEditingController();
  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Change address'),
              content: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter address...',
                ),
              ),
              actions: [
                MaterialButton(
                    onPressed: () {
                      //updateAddress
                      String newAddress = textController.text;
                      context.read<Restaurant>().updateDeliveryAddress(newAddress);
                      Navigator.pop(context);
                      textController.clear();
                    },
                    child: const Text('Save')),
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      textController.clear();
                    },
                    child: const Text('Cancel')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver to: ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
               Consumer<Restaurant>(builder: (context, restaurant, child) => 
                Text(
                 restaurant.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               ),

                Icon(
                  Icons.location_on,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
