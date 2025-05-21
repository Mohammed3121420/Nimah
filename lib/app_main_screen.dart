import 'package:flutter/material.dart';
// *شاشات العميل
import 'package:nimah/features/cart/presentation/screen/my_cart_screen.dart';
import 'package:nimah/features/home/presentation/screen/home_screen.dart';
import 'package:nimah/features/order/presentation/screen/my_order_screen.dart';
import 'package:nimah/features/profile/presentation/screen/profile_screen.dart';
//* شاشات المطعم
import 'features/restaurant/presentation/screen/restaurant_home_screen.dart';
import 'features/restaurant/presentation/screen/restaurant_orders_screen.dart';

class AppMainScreen extends StatefulWidget {
  final bool isRestaurantUser;

  const AppMainScreen({super.key, required this.isRestaurantUser});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;

  late final List<Widget> customerScreens;
  late final List<Widget> restaurantScreens;
  late final List<BottomNavigationBarItem> customerNavItems;
  late final List<BottomNavigationBarItem> restaurantNavItems;

  @override
  void initState() {
    super.initState();

    customerScreens = [
      HomeScreen(),
      MyOrdersScreen(),
      MyCartScreen(),
      ProfileScreen(),
    ];

    restaurantScreens = [RestaurantHomeScreen(), RestaurantOrdersScreen()];

    customerNavItems = [
      BottomNavigationBarItem(
        icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(selectedIndex == 1 ? Icons.receipt : Icons.receipt_outlined),
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
          selectedIndex == 3 ? Icons.person : Icons.person_outline_outlined,
        ),
        label: 'Profile',
      ),
    ];

    restaurantNavItems = [
      BottomNavigationBarItem(
        icon: Icon(selectedIndex == 0 ? Icons.store : Icons.store_outlined),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(selectedIndex == 1 ? Icons.receipt : Icons.receipt_outlined),
        label: 'Orders',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isRestaurant = widget.isRestaurantUser;
    final screens = isRestaurant ? restaurantScreens : customerScreens;
    final navItems = isRestaurant ? restaurantNavItems : customerNavItems;

    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: selectedIndex,
        iconSize: 22,
        selectedLabelStyle: TextStyle(
          color: Colors.orange[700],
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: navItems,
      ),
    );
  }
}
