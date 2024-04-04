import 'package:flutter/material.dart';
import 'package:delivery/components/my_receipt.dart';
import 'package:delivery/models/restaurant.dart';
import 'package:delivery/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState(){
    super.initState();
    //save order to db
   String receipt = context.read<Restaurant>().DisplayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const Column(
        children: [
        MyReceipt(),
              ],
            ),
          );
  }

  // Custom Bottom Nav Bar - Message / Call delivery person
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.person),
          onPressed: (){},
        ),
      ),

      //driver info



      //message button



      //call button
        ],
        ),
      );
}
}