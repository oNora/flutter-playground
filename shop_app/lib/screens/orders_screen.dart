import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ordert.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: ((context, index) => OrderItem(orderData.orders[index])),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
