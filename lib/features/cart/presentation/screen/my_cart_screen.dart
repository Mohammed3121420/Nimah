import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int quantity = 1;
  //! بيانات الطلبات في السلة  استبدالها ببيانات حقيقية من قاعدة البيانات
  final List<Map<String, dynamic>> cartItems = [
    {
      "title": "Strawberry shake",
      "date": "29 Nov, 01:20 pm",
      "price": 15.00,
      "items": 2,
      "image": "assets/9531.jpg",
    },
    {
      "title": "Broccoli Lasagna",
      "date": "29 Nov, 12:00 pm",
      "price": 7.99,
      "items": 1,
      "image": "assets/9531.jpg",
    },
    {
      "title": "Broccoli Lasagna",
      "date": "29 Nov, 12:00 pm",
      "price": 7.99,
      "items": 1,
      "image": "assets/9531.jpg",
    },
    {
      "title": "Broccoli Lasagna",
      "date": "29 Nov, 12:00 pm",
      "price": 7.99,
      "items": 1,
      "image": "assets/9531.jpg",
    },
    {
      "title": "Broccoli Lasagna",
      "date": "29 Nov, 12:00 pm",
      "price": 7.99,
      "items": 1,
      "image": "assets/9531.jpg",
    },
  ];

  final double subtotal = 32.00;
  final double tax = 5.00;
  final double delivery = 3.00;

  @override
  Widget build(BuildContext context) {
    final double total = subtotal + tax + delivery;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ...cartItems.map((item) => _buildCartItem(item)).toList(),
                  const SizedBox(height: 20),

                  _buildPriceDetails(),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    minimumSize: const Size(
                      double.infinity,
                      40,
                    ), // تم تصغير الارتفاع
                  ),
                  onPressed: () {
                    // تنفيذ الطلب
                  },
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 14), // تصغير حجم الخط
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item["image"],
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
                        item["title"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text(
                      'SR${item["price"].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      item["date"],
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(width: 110),
                    Text(
                      '${item["items"]} items',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Row(
                  children: [
                    // زر الإلغاء
                    GestureDetector(
                      onTap: () {
                        //! إجراء إلغاء الطلب
                      },
                      child: Container(
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
                    ),
                    const SizedBox(width: 50),
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() => quantity--);
                        }
                      },
                      icon: Icon(Icons.remove_circle_outline),
                      iconSize: 20,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () => setState(() => quantity++),
                      icon: Icon(Icons.add_circle_outline),
                      iconSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildPriceRow('Subtotal', subtotal),
          const SizedBox(height: 8),
          _buildPriceRow('Tax and Fees', tax),
          const SizedBox(height: 8),
          _buildPriceRow('Delivery', delivery),
          const Divider(height: 30),
          _buildPriceRow('Total', subtotal + tax + delivery, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey[600],
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.orange : Colors.black,
          ),
        ),
      ],
    );
  }
}
