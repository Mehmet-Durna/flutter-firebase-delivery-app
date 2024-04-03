import 'package:delivery/components/my_button.dart';
import 'package:delivery/components/my_cart_tile.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context,restaurant,child){
        //cart
        final userCart = restaurant.cart;

        // scaffold ui
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              userCart.isNotEmpty ? IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                     builder: (context)=> AlertDialog(
                      title: Text("Are you sure you want to clear your cart?"),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),

                        // yes button
                        TextButton(
                          onPressed: (){
                            restaurant.clearCart();
                            Navigator.pop(context);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                     )
                     );
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ) : const SizedBox(),
            ],
          ),
          body: Column(
            children: [
              // cart items
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty ? 
                    // center empty cart message
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    )
                    )
                    
                    : 
                
                    
                    Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index){
                          // get cart item
                          final cartItem = userCart[index];
                
                          // return cart item tile
                          return MyCartTile(cartItem: cartItem);
                        }
                      ),
                    ) 
                  ],
                ),
              ),

              // button to checkout

              MyButon(onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              
              ),   text: 'Checkout'),

              const SizedBox(height: 25),
            ],
          ),
        );
      }
    );
  }
}