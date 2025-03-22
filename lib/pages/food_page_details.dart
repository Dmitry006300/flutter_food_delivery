import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/database/restaurant_data.dart';
import 'package:flutter_food_delivery/models/food_model.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    for (var addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<StatefulWidget> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close and go back
    Navigator.pop(context);
    //add to cart
    List<Addon> addonSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        addonSelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, addonSelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.food.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.food.imagePath,
                //    fit: BoxFit.cover,
              ),

              Text(
                widget.food.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              Text(
                '\$' + widget.food.price.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              Text(
                widget.food.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              //adddons
              Divider(
                color: Theme.of(context).colorScheme.primary,
                thickness: 2,
              ),
              Text(
                'Add-ons',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context, index) {
                    //Addon checkbox
                    Addon addon = widget.food.availableAddons[index];
                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text('\$' + addon.price.toString()),
                      value: widget.selectedAddons[addon],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.selectedAddons[addon] = value!;
                        });
                      },
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                    // add to cart button
                    ElevatedButton(
                      onPressed: () {
                        addToCart(widget.food, widget.selectedAddons);
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
