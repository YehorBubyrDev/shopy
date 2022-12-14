import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider/order_provider.dart';
import '../providers/cart_provider/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Column(
          children: [
            TotalCard(cart: cart),
            const SizedBox(height: 10),
            CartList(cart: cart),
          ],
        ));
  }
}

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, i) {
          return CartElement(
            id: cart.items.values.toList()[i].id,
            productId: cart.items.keys.toList()[i],
            price: cart.items.values.toList()[i].price,
            quantity: cart.items.values.toList()[i].quantity,
            title: cart.items.values.toList()[i].title,
          );
        },
      ),
    );
  }
}

class TotalCard extends StatelessWidget {
  const TotalCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartProvider cart;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Chip(
              label: Text(
                "\$${cart.totalAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            const Spacer(),
            TextButton(
              onPressed: () => {
                Provider.of<OrdersProvider>(
                  context,
                  listen: false,
                ).addOrder(
                  cart.items.values.toList(),
                  cart.totalAmount,
                ),
                cart.clearCart()
              },
              child: Text(
                'ORDER NOW',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
