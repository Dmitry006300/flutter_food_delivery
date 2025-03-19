import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/quantity_selector.dart';
import 'package:flutter_food_delivery/data/restaurant_data.dart';
import 'package:flutter_food_delivery/models/cart_item.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;

  const CartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.food.name,
                              style: TextStyle(//color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$' + cartItem.food.price.toString(),
                              style: TextStyle(color: Theme.of(context).colorScheme.primary,),
                            )
                          ],
                        ),
                        Spacer(),
                        QuantitySelector(
                            food: cartItem.food,
                            onIncrement: () {
                              restaurant.addToCart(
                                  cartItem.food, cartItem.selectedAddons);
                            },
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            },
                            quantity: cartItem.quantity),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      scrollDirection: Axis.horizontal,
                      children: cartItem.selectedAddons
                          .map((addon) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                                  label: Row(
                                    children: [
                                      Text(addon.name),
                                      Text(
                                        '\$' + addon.price.toString(),
                                        style: TextStyle(color: Theme.of(context).colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                  onSelected: (value) {},
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    fontSize: 12,
                                  ),
                                ),
                          ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ));
  }
}
