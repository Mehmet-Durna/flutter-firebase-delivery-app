import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    // text style

    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );


    return Container(
      decoration: BoxDecoration(
     border: Border.all(color: Theme.of(context).colorScheme.secondary),
     borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('\$0.99', style: myPrimaryTextStyle),
              Text('Delivery fee', style: mySecondaryTextStyle),
            ],
          ),
                Column(
            children: [
              Text('15 - 30 min', style: myPrimaryTextStyle),
              Text('Delivery time', style: mySecondaryTextStyle),
            ],
          )
        ],
      ),
    );
  }
}