import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              Icons.more_vert,
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
          )
        ],
      ),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
