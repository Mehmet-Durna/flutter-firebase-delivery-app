import 'package:collection/collection.dart';
import 'package:delivery/models/cart_item.dart';
import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{

  //list of food menu 
  final List<Food> _menu =[
    //burgers
    Food(
      name: 'Cheese Burger', 
      description: 'A classic cheese burger with beef patty, cheese, lettuce, tomato, and pickles',
      imagePath: 'lib/images/burgers/cheese_burger.png',
      price: 5.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ]
    ),  

    
    Food(
      name: 'Chicken Burger', 
      description: 'A classic chicken burger with grilled chicken, lettuce, tomato, and pickles',
      imagePath: 'lib/images/burgers/chicken_burger.jpg',
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ]
    ),
    Food(
      name: 'Veggie Burger', 
      description: 'A classic veggie burger with veggie patty, lettuce, tomato, and pickles',
      imagePath: 'lib/images/burgers/veggie_burger.jpg',
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Patty', price: 1.50),
        Addon(name: 'Extra Pickles', price: 0.25),
      ]
    ),

    //salads

    Food(
      name: 'Garden Salad', 
      description: 'A classic garden salad with lettuce, tomato, cucumber, and olives',
      imagePath: 'lib/images/salads/garden_salad.jpg',
      price: 3.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    Food(
      name: 'Caesar Salad', 
      description: 'A classic caesar salad with lettuce, croutons, parmesan cheese, and caesar dressing',
      imagePath: 'lib/images/salads/caesar_salad.jpg',
      price: 4.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    //sides

    Food(
      name: 'French Fries', 
      description: 'A classic side of french fries',
      imagePath: 'lib/images/sides/french_fries.jpg',
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    Food(
      name: 'Onion Rings', 
      description: 'A classic side of onion rings',
      imagePath: 'lib/images/sides/onion_rings.jpg',
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    //desserts

    Food(
      name: 'Chocolate Cake', 
      description: 'A classic slice of chocolate cake',
      imagePath: 'lib/images/desserts/chocolate_cake.jpg',
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    Food(
      name: 'Cheesecake', 
      description: 'A classic slice of cheesecake',
      imagePath: 'lib/images/desserts/cheesecake.jpg',
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    //drinks

    Food(
      name: 'Coke', 
      description: 'A classic can of coke',
      imagePath: 'lib/images/drinks/coke.jpg',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),

    Food(

      name: 'Pepsi', 
      description: 'A classic can of pepsi',
      imagePath: 'lib/images/drinks/pepsi.jpg',
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.50),
        Addon(name: 'Extra Chicken', price: 1.50),
        Addon(name: 'Extra Dressing', price: 0.25),
      ]
    ),
    
  ];

  /*
 G E T T E R S
 */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;




 /*
O P E R A T I O N S
 */

// user cart
final List<CartItem> _cart = [];

  //add to cart

  void addToCart(Food food, List<Addon> selectedAddons){
    // see if there is a cart item already with the same food and addons
    CartItem? cartItem = _cart.firstWhereOrNull((item){
      //check if the food is the same
      bool isSameFood = item.food == food;

      //check if the addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if there is a cart item already with the same food and addons
    if(cartItem != null){
      //increment the quantity
      cartItem.quantity++;
      }
      // otherwise create a new cart item
      else{
        _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
      }
      notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);

  if(cartIndex != -1){
    if(_cart[cartIndex].quantity > 1){
      _cart[cartIndex].quantity--;
  }else{
    _cart.removeAt(cartIndex);
  }
  }
  notifyListeners();
  }

  //get total price of cart

  double get totalCartPrice{
    double total = 0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.totalPrice;
      
      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart

  void clearCart(){
    _cart.clear();
    notifyListeners();
  }



 /*
 H E L P E R S
 */

  //generate a receipt
  //format double value into money
  // format list of addons into string summary
}