import 'package:flutter/material.dart';

import '../screen/product_detail_page.dart';

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
                (context) => ProductDetailScreen(
                  title: title,
                  image: image,
                  price: price,
                ),
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
