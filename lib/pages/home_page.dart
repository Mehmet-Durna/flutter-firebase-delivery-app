import 'package:delivery/components/my_current_location.dart';
import 'package:delivery/components/my_description_box.dart';
import 'package:delivery/components/my_food_tile.dart';
import 'package:delivery/components/my_sliver_app_bar.dart';
import 'package:delivery/components/my_tab_bar.dart';
import 'package:delivery/models/food.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  // tab controller
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

  //  sort out and return the food items based on the category

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  // sort out and return the food items based on the category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){

      // get food items in this category
    List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

    return ListView.builder(
      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        // get individual food item
        final food = categoryMenu[index];

        // return food tile UI
        return FoodTile(
          food: food,
           onTap: ()=> Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> FoodPage(food: food),
              ),
           ),
           );
      }
    );
     
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
        [MySliverAppBar(
          title: MyTabBar(tabController: _tabController),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Divider(
                indent: 25,
                endIndent:25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              // my current location

              const MyCurrentLocation(),


              // description  box

              const MyDescriptionBox(),
            ],
          )
        ),
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child)=> TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          ),
      ),
    );
  }
}