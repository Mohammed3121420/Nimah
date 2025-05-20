import 'package:flutter/material.dart';
import 'package:nimah/features/cart/presentation/screen/my_cart_screen.dart';
import 'package:nimah/features/home/presentation/screen/home_screen.dart';

import 'features/order/presentation/screen/my_order_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> screen;
  @override
  void initState() {
    screen = [
      HomeScreen(),
      MyOrdersScreen(),
      MyCartScreen(),
      navBaeScreen(Icons.person),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: selectedIndex,
        iconSize: 20,
        selectedLabelStyle: TextStyle(
          color: Colors.orange[700],
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 1 ? Icons.receipt : Icons.receipt_outlined,
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 2
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 3 ? Icons.person : Icons.person_2_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: screen[selectedIndex],
    );
  }

  navBaeScreen(iconName) {
    return Center(child: Icon(iconName, size: 100, color: Colors.orange[700]));
  }
}
