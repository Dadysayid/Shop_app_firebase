import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/pages/settings.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const ProductList(),
    const CartPage(),
    const Settings(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        items: const [
          CurvedNavigationBarItem(
            child: SizedBox(
              height: 30, // Control space around the icon
              child: Icon(Icons.home, size: 30),
            ),
            label: '', // Empty label
          ),
          CurvedNavigationBarItem(
            child: SizedBox(
              height: 30,
              child: Icon(Icons.shopping_cart, size: 30),
            ),
            label: '', // Empty label
          ),
          CurvedNavigationBarItem(
            child: SizedBox(
              height: 30,
              child: Icon(Icons.settings, size: 30),
            ),
            label: '', // Empty label
          ),
        ],
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
