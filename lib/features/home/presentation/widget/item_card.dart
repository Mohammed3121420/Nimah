import 'package:flutter/material.dart';
import '../../../order/presentation/screen/product_detail_page.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  const ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  //!  ProductDetailScreen هنا راح ترسل اسم الاكله و الوصف و السعر الموجوده في الداتا بيس الى صفحه
                  (context) => ProductDetailScreen(
                    title: title,
                    image: image,
                    price: price,
                  ),
            ),
          );
        },
        //! هنا راح يتغير راح يكون البيانات حق الداتا بيس
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.location_on, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('1.1 Km', style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      Icon(Icons.access_time, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        '8:30 AM - 11:00 PM',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('9.5', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'RY29.00',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
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
