import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/providers/cart_provider/cart.dart';
import 'package:shopy/screens/cart_screen.dart';
import 'package:shopy/widgets/badge.dart';
import '../providers/products_provider/products.dart';
import '../widgets/products_grid.dart';
import '../models/enum/product.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static String routeName = '/products-overview-screen';
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buba Magaz",
          style: TextStyle(fontSize: 36),
        ),
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemsCount.toString(),
              child: ch as Widget,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.sort,
            ),
            itemBuilder: ((_) => [
                  const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('Your Favorites'),
                  ),
                  const PopupMenuItem(
                    value: FilterOptions.All,
                    child: Text('Show All'),
                  ),
                ]),
          ),
        ],
      ),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
