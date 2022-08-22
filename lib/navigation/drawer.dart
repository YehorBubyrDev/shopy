import 'package:flutter/material.dart';
import 'package:shopy/screens/cart_screen.dart';
import '../screens/orders_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Categories:',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Main',
            Icons.home,
            () => {Navigator.of(context).pushReplacementNamed('/')},
          ),
          buildListTile(
            'Orders',
            Icons.shopping_cart,
            () => {Navigator.of(context).pushNamed(OrdersScreen.routeName)},
          ),
          buildListTile(
            'Cart',
            Icons.shopping_bag,
            () => {Navigator.of(context).pushNamed(CartScreen.routeName)},
          ),
        ],
      ),
    );
  }
}
