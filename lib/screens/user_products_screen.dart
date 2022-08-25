import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation/drawer.dart';
import '../screens/edit_product_screen.dart';
import '../providers/products_provider/products.dart';
import '../widgets/user_product.item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Manage products',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditProductScreen.routeName),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: ((context, index) => Column(
                  children: [
                    UserProductItem(
                      productData.items[index].id,
                      productData.items[index].title,
                      productData.items[index].imageUrl,
                    ),
                    const Divider(),
                  ],
                )),
          ),
        ));
  }
}
