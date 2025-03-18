import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/food_model.dart';

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
List <Food> get menu => _menu;

  //OPERATIONS
          //add to cart

          //remove from cart

          //get total price

          //get total items

          //clear cart
        


  //HELPERS FUNCTIONS

  //generate a receipt

  //format double to money

  //format list of addons to string
}
