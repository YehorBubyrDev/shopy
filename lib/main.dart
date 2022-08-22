import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products_provider/products.dart';
import './providers/cart_provider/cart.dart';
import './providers/ordrers_provider/order_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => OrdersProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Lato',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        routes: {
          '/': (context) => const ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (ctx) => const ProductsOverviewScreen());
        },
      ),
    );
  }
}
