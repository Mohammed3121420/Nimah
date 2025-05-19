import 'package:flutter/material.dart';

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

class OrderItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String itemCount;
  final String price;
  final String deliveryTime;

  const OrderItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.itemCount,
    required this.price,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    ProductDetailPage(title: title, image: image, price: price),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    itemCount,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Cancel Button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7043),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Cancel Order',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Delivery Time Label
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          deliveryTime,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
