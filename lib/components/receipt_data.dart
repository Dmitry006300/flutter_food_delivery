import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/database/restaurant_data.dart';
import 'package:provider/provider.dart';

class ReceiptData extends StatelessWidget {
  const ReceiptData({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Thank you for your order!"),
          const SizedBox(height: 25,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(25),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) =>
              Text(restaurant.displayCartRecript()),
          ),
          ),
        ],
      ),
    ),
    );
  }
}