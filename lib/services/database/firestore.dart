import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  // get collection of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  // save order to firestore
  Future<void> saveOrderToDatabase(String receipt) async{
    try{
      await orders.add({
        'date': DateTime.now(),
        'order': receipt,
      });
    }
    // catch any errors
    catch(e){
      throw Exception(e);
    }
  }

}