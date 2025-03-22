import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/receipt_data.dart';
import 'package:flutter_food_delivery/database/firestore.dart';
import 'package:flutter_food_delivery/database/restaurant_data.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

//saveOrdersToDatabase
FirestoreService db = FirestoreService();
@override
void initState() {
  super.initState();
  String receipt = context.read<Restaurant>().displayCartRecript();
  db.saveOrdersToDatabase(receipt);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: const Text("Delivery in progress.."),
        backgroundColor: Colors.transparent,
      ),
      body: const Column(
        children: [ReceiptData()],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),
            child: IconButton(icon: Icon(Icons.person_2), onPressed: () {}),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("supplier"),
              Text("supplier name"),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    icon: Icon(Icons.message),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {}),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    icon: Icon(Icons.call),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
