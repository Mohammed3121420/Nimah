import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RestaurantOrdersScreen extends StatefulWidget {
  const RestaurantOrdersScreen({super.key});

  @override
  State<RestaurantOrdersScreen> createState() => _RestaurantOrdersScreenState();
}

class _RestaurantOrdersScreenState extends State<RestaurantOrdersScreen> {
  final currencyFormatter = NumberFormat.simpleCurrency(locale: 'en');

  List<Map<String, dynamic>> orders = [
    {
      'id': '1',
      'meal': 'Strawberry shake',
      'date': '28 Nov, 01:20 pm',
      'price': 15.00,
      'items': 2,
      'timeLeft': '10 min',
      'status':
          'Pending', //! يمكن أن تكون: Pending, Preparing, Ready, Cancelled
    },
    {
      'id': '2',
      'meal': 'Chicken Sandwich',
      'date': '29 Nov, 02:30 pm',
      'price': 12.50,
      'items': 1,
      'timeLeft': '15 min',
      'status': 'Ready',
    },
    {
      'id': '1',
      'meal': 'Strawberry shake',
      'date': '28 Nov, 01:20 pm',
      'price': 15.00,
      'items': 2,
      'timeLeft': '10 min',
      'status': 'Pending',
      'ingredients': [
        // <- مكونات الطلب
        {"name": "Vegan Mayo", "price": 2.99, "selected": true},
        {"name": "Sliced Tomatoes", "price": 1.99, "selected": true},
      ],
    },
    {
      'id': '2',
      'meal': 'Chicken Sandwich',
      'date': '29 Nov, 02:30 pm',
      'price': 12.50,
      'items': 1,
      'timeLeft': '15 min',
      'status': 'Pending',
    },
    {
      'id': '3',
      'meal': 'Beef Burger',
      'date': '29 Nov, 03:45 pm',
      'price': 18.00,
      'items': 3,
      'timeLeft': '5 min',
      'status': 'Pending',
      'ingredients': [
        {"name": "Whole Wheat Buns", "price": 2.00, "selected": true},
        {"name": "Bell Peppers", "price": 1.25, "selected": true},
      ],
    },
    {
      'id': '3',
      'meal': 'Beef Burger',
      'date': '29 Nov, 03:45 pm',
      'price': 18.00,
      'items': 3,
      'timeLeft': '5 min',
      'status': 'Preparing',
    },
  ];

  void _acceptOrder(int index) {
    setState(() {
      orders[index]['status'] = 'Preparing';
    });
    //! هنا يمكنك إضافة كود إرسال القبول للخادم
  }

  void _cancelOrder(int index) {
    if (orders[index]['status'] != 'Pending') return;

    setState(() {
      orders[index]['status'] = 'Cancelled';
    });

    //! هنا يمكنك إضافة كود إرسال الإلغاء للخادم
  }

  void _completeOrder(int index) {
    setState(() {
      orders[index]['status'] = 'Ready';
    });
    //! هنا يمكنك إضافة كود إرسال الإكمال للخادم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...orders.asMap().entries.map((entry) {
              final index = entry.key;
              final order = entry.value;
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! معلومات الطلب
                    Text(
                      order['meal'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      order['date'],
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 12),
                    // !مكونات الطلب (إن وجدت)
                    if (order.containsKey('ingredients') &&
                        order['ingredients'] != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Ingredients:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 6),
                          ...order['ingredients'].map<Widget>((ingredient) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ingredient['name']),
                                  Text(
                                    currencyFormatter.format(
                                      ingredient['price'],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),

                    //! السعر وعدد القطع
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currencyFormatter.format(order['price']),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${order['items']} items',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    //! حالة الطلب
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(order['status']),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        order['status'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // !أزرار التحكم حسب حالة الطلب
                    if (order['status'] == 'Pending')
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _acceptOrder(index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Accept Order'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => _cancelOrder(index),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.red),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      )
                    else if (order['status'] == 'Preparing')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimated time: ${order['timeLeft']}',
                            style: TextStyle(
                              color: Colors.orange[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => _completeOrder(index),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Mark as Ready'),
                          ),
                        ],
                      )
                    else if (order['status'] == 'Ready')
                      const Text(
                        'Ready for delivery',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    else if (order['status'] == 'Cancelled')
                      const Text(
                        'Order Cancelled',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Preparing':
        return Colors.blue;
      case 'Ready':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
