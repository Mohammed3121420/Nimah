import 'package:flutter/material.dart';

import '../widget/order_item_card.dart';
import 'product_detail_page.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  final List<Map<String, String>> orders = const [
    {
      'image': 'assets/9531.jpg',
      'title': 'Strawberry Shake',
      'date': '29 Nov, 01:20 pm',
      'itemCount': '2 items',
      'price': 'SR15.00',
      'deliveryTime': '10 min',
    },
    {
      'image': 'assets/9531.jpg',
      'title': 'Veg Pizza',
      'date': '29 Nov, 01:20 pm',
      'itemCount': '1 item',
      'price': 'SR25.00',
      'deliveryTime': '15 min',
    },
    {
      'image': 'assets/9531.jpg',
      'title': 'Burger & Fries',
      'date': '28 Nov, 12:05 pm',
      'itemCount': '3 items',
      'price': 'SR30.00',
      'deliveryTime': '20 min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderItemCard(
            image: order['image']!,
            title: order['title']!,
            date: order['date']!,
            itemCount: order['itemCount']!,
            price: order['price']!,
            deliveryTime: order['deliveryTime']!,
          );
        },
      ),
    );
  }
}
