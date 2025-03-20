import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/cart_tile.dart';
import 'package:flutter_food_delivery/data/restaurant_data.dart';
import 'package:flutter_food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;
      //UI
      return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure to clear the cart?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              //list of cart

              Expanded(
                child: Column(children: [
                  userCart.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("Cart is empty..."),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              final cartItem = userCart[index];
                              return CartTile(cartItem: cartItem);
                            },
                          ),
                        ),
                ]),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      ),
                  child: Text('Go to payment')),

              SizedBox(
                height: 25,
              )
            ],
          ));
    });
  }
}
