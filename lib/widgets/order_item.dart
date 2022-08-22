import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders_provider/order_provider.dart' as ord;

class OrderElement extends StatelessWidget {
  final ord.OrderItem order;
  const OrderElement({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.time),
            ),
            trailing: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.expand),
            ),
          ),
        ],
      ),
    );
  }
}
