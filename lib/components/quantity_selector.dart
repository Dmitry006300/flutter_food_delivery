import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/food_model.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

   const QuantitySelector({
    super.key,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: Icon(
                Icons.remove,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 25,
                child: Center(child: Text(quantity.toString()),)), 
            ),
             GestureDetector(
              onTap: onIncrement,
              child: Icon(
                Icons.add,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

          ],
        ));
  }
}
