import 'package:flutter_food_delivery/models/food_model.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem(
      {required this.food, this.quantity = 1, required this.selectedAddons});

  double get totalPrice {
    double addonPrice =
        selectedAddons.fold(0, (sum, adddon) => sum + adddon.price);
    return (food.price + addonPrice) * quantity;
  }
}
