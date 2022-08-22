import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final bool _showOnlyFavorites;
  const ProductsOverviewScreen(this._showOnlyFavorites, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ProductGrid(_showOnlyFavorites));
  }
}
