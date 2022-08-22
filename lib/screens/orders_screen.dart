import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      body: Text('test'),
    );
  }
}
