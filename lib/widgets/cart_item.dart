import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider/cart.dart';

class CartElement extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartElement(
      {required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      confirmDismiss: ((direction) {
        return showDialog(
          context: context,
          builder: ((context) => const DeleteAlert()),
        );
      }),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: FittedBox(child: Text('\$$price')),
            ),
            title: Text(title),
            subtitle: Text('Total: \$ ${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}

class DeleteAlert extends StatelessWidget {
  const DeleteAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to remove the item from the cart?'),
      actions: [
        TextButton(
          child: const Text('No'),
          onPressed: () => {Navigator.of(context).pop(false)},
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () => {Navigator.of(context).pop(true)},
        ),
      ],
    );
  }
}
