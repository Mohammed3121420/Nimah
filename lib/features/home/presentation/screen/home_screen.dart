import 'package:flutter/material.dart';
import 'package:nimah/features/home/presentation/widget/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.tune, color: Colors.orange),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Banner
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // البيانات على اليسار
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Claim your\ndiscount 30%\ndaily now!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              //! أضف هنا الأكشن الذي تريده عند الضغط على الزر
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textStyle: const TextStyle(fontSize: 13),
                              elevation: 0,
                            ),
                            child: const Text('Order Now'),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // الصورة على اليمين
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/9531.jpg',
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Departments Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Departments',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      //! أضف هنا الأكشن الذي تريده عند الضغط على الزر
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              //! هنا راح يتم حذف هذي البيانات
              ItemCard(
                title: 'Crazy taco',
                description: 'Delicious tacos, appetizers, snacks...',
                image: 'assets/9531.jpg',
                price: "SR15.00",
              ),
              ItemCard(
                title: 'La Salada',
                description: 'Fresh and tasty food.',
                image: 'assets/9531.jpg',
                price: "SR15.00",
              ),
              ItemCard(
                title: 'La Salada',
                description: 'Fresh and tasty food.',
                image: 'assets/9531.jpg',
                price: "SR15.00",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
