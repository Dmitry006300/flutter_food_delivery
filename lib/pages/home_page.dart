import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/food_tile.dart';
import 'package:flutter_food_delivery/components/sliver_app_bar.dart';
import 'package:flutter_food_delivery/components/user_current_location.dart';
import 'package:flutter_food_delivery/components/user_description_box.dart';
import 'package:flutter_food_delivery/components/widget_drawer.dart';
import 'package:flutter_food_delivery/components/widget_tab_br.dart';
import 'package:flutter_food_delivery/database/restaurant_data.dart';
import 'package:flutter_food_delivery/models/food_model.dart';
import 'package:flutter_food_delivery/pages/food_page_details.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

@override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

List<Food> _filterFoodByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

List<Widget> getFoodByCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category){
      List<Food> categoryMenu = _filterFoodByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(food: food, 
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food)));
          },
          );
          
          // ListTile(
          //   title: Text(categoryMenu[index].name),
          // );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: WidgetDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          WidgetSliverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 2,
                ),

                //current location
               UserCurrentLocation(),

                //description box
             WidgetDescriptionBox(),
              ],
            ),
            
            title: WidgetTabBar(tabController: _tabController),
            ),
        ], 
        //TabBarView
        body: Consumer<Restaurant> (
          builder: (context, restaurant, child) {
            return TabBarView(
              controller: _tabController,
              children: getFoodByCategory(restaurant.menu),
            );
          },
        ),
    ),
    );
  }
}