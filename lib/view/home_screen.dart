import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/view/cart_screen.dart';
import 'package:mainproject/view/category_screen.dart';
import 'package:mainproject/view/product_view.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  ScreenHomeState createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  int currentIndex = 0;

  final CartController cartController = Get.put(CartController());

  final List<Widget> _pages = [
    const ScreenProducts(),
    const ScreenCategory(),
    ScreenCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // Added subtle transition animation
        child: _pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set fixed type to control icon placement
        backgroundColor: Colors.grey.shade100, // Softer background color for the nav bar
        currentIndex: currentIndex,
        selectedItemColor: UIColors.main, // Stronger color for selected item
        unselectedItemColor: Colors.grey.shade600, // Softer color for unselected items
        selectedFontSize: 14,
        unselectedFontSize: 12, // Smaller unselected text size for subtle contrast
        elevation: 8, // Added shadow to the bottom navigation bar
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), // Outlined icon for unselected
            activeIcon: Icon(Icons.home), // Filled icon for selected
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
