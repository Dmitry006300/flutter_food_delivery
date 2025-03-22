import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  //save orders to DB
  Future<void> saveOrdersToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
    });
  }
}
