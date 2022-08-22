import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider/order_provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context, index) =>
            OrderElement(order: ordersData.orders[index]),
      ),
    );
  }
}
