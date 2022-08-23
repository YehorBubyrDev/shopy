import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/orders_screen.dart';
import '../screens/favorite_screen.dart';
import '../models/enum/product.dart';
import '../providers/cart_provider/cart.dart';
import '../screens/cart_screen.dart';
import '../screens/products_overview_screen.dart';
import '../widgets/badge.dart';
import './drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': const ProductsOverviewScreen(),
      'title': 'Main',
    },
    {
      'page': const FavoriteScreen(),
      'title': 'Favorites',
    },
    {
      'page': const OrdersScreen(),
      'title': 'Orders',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedPageIndex == 0
              ? "Shopy"
              : '${_pages[_selectedPageIndex]['title']}',
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Colors.white,
          ),
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
            onSelected: (FilterOptions selectedValue) {},
            icon: const Icon(
              Icons.info_outline,
            ),
            itemBuilder: ((_) => [
                  const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('About us'),
                  ),
                  const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('Privacy Policy'),
                  ),
                ]),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
