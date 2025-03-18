import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/food_model.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 20),
                      ),
                      Text(
                        '\$' + food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                  
                      Text(
                        food.description,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                Image.asset(
                  food.imagePath,
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
                ),
              ],
            ),
          ),
        ),

        Divider(
          color: Theme.of(context).colorScheme.primary,
          thickness: 2,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
