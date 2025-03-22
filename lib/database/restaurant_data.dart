import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/cart_item.dart';
import 'package:flutter_food_delivery/models/food_model.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
// PIZZA
    Food(
      name: 'Pizza Chicken',
      description: 'Pizza with Chicken and cheese',
      imagePath: 'images/pizzas/pizza1.png',
      price: 12.99,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Pepperoni', price: 2.99),
      ],
    ),
    Food(
      name: 'Cheese Pizza',
      description: 'Pizza with cheese',
      imagePath: 'images/pizzas/pizza2.png',
      price: 9.99,
      category: FoodCategory.pizzas,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Pepperoni', price: 2.99),
      ],
    ),
    //BURGERS
    Food(
      name: 'Burger',
      description: 'Burger with beef patty',
      imagePath: 'images/burgers/burger1.png',
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    Food(
      name: 'Burger Extra Meat',
      description: 'Burger with extra beef patty',
      imagePath: 'images/burgers/burger2.png',
      price: 11.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    //Fries
    Food(
      name: 'Fries',
      description: 'Fries with ketchup',
      imagePath: 'images/fries/fries1.png',
      price: 3.99,
      category: FoodCategory.fries,
      availableAddons: [
        Addon(name: 'Extra Ketchup', price: 0.99),
        Addon(name: 'Extra Salt', price: 0.99),
      ],
    ),
    //Salad
    Food(
      name: 'Salad',
      description: 'Salad with ranch dressing',
      imagePath: 'images/salads/salad1.png',
      price: 5.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Dressing', price: 0.99),
        Addon(name: 'Extra Croutons', price: 0.99),
      ],
    ),
    Food(
      name: 'Chicken salad',
      description: 'Salad with chicken and ranch dressing',
      imagePath: 'images/salads/salad2.png',
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Dressing', price: 0.99),
        Addon(name: 'Extra Croutons', price: 0.99),
      ],
    ),
    //Drinks
    Food(
      name: 'Lemonade',
      description: 'Lemonade in a cup',
      imagePath: 'images/drinks/drink1.png',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Ice', price: 0.99),
        Addon(name: 'Extra Sugar', price: 0.99),
      ],
    ),
    Food(
      name: 'Tea',
      description: 'Tea in a cup',
      imagePath: 'images/drinks/drink2.png',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Ice', price: 0.99),
        Addon(name: 'Extra Sugar', price: 0.99),
      ],
    ),
//Meats
    Food(
      name: 'Meat',
      description: 'Meat with sauce',
      imagePath: 'images/meats/meat1.png',
      price: 15.99,
      category: FoodCategory.meats,
      availableAddons: [
        Addon(name: 'Extra BBQ Sauce', price: 0.99),
        Addon(name: 'Extra cheese', price: 0.99),
      ],
    ),
    Food(
      name: 'Meat on bone',
      description: 'Meat on bone with sauce',
      imagePath: 'images/meats/meat2.png',
      price: 17.99,
      category: FoodCategory.meats,
      availableAddons: [
        Addon(name: 'Extra BBQ Sauce', price: 0.99),
        Addon(name: 'Extra cheese', price: 0.99),
      ],
    ),
  ];

  //GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //OPERATIONS
  //user cart
  final List<CartItem> _cart = [];
  String _deliveryAddress = 'Enter your address...';
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //check if food is already in cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total items
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

void updateDeliveryAddress(String newAddress){
_deliveryAddress = newAddress;
notifyListeners();

}

  //HELPERS FUNCTIONS

  //generate a receipt
  String displayCartRecript() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipr.");
    receipt.writeln();

    //format the date
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
            "      Add_ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
receipt.writeln();
receipt.writeln('Delivering to: $deliveryAddress');
    return receipt.toString();
  }

  //format double to money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons to string
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
