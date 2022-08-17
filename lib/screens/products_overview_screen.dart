import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/providers/products_provider.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static String routeName = '/products-overview-screen';
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backPack = Provider.of<ProductsProvider>(context).findById('p1');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopy",
          style: TextStyle(fontSize: 36),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<ProductsProvider>(context, listen: false)
                  .addProduct(backPack);
            },
          )
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
