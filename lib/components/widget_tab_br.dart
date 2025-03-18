import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/food_model.dart';

class WidgetTabBar extends StatelessWidget {
 final TabController tabController;
  
  const WidgetTabBar({
    super.key, 
    required this.tabController
    });

List<Tab> _buildFoodCategoryTabs() {
  return FoodCategory.values.map((e) => Tab(text: e.toString().split('.').last,),).toList();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController, 
        tabs: _buildFoodCategoryTabs(),
        isScrollable: true,
        ),
    );
  }
}
