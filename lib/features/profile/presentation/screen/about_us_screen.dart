import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Icon(
                  Icons.restaurant,
                  size: 60,
                  color: Colors.orange[700],
                ),
              ),
            ),
            const SizedBox(height: 30),

            _buildSectionTitle('Our Story'),
            const SizedBox(height: 10),
            _buildSectionText(
              'Founded in 2023, our restaurant aims to provide exceptional dining experiences '
              'with a focus on quality ingredients and authentic flavors. We take pride in serving '
              'our community with delicious meals prepared by our talented chefs.',
            ),
            const SizedBox(height: 25),

            _buildSectionTitle('Our Mission'),
            const SizedBox(height: 10),
            _buildSectionText(
              'To revolutionize the food industry by combining traditional recipes with modern '
              'culinary techniques, while maintaining sustainable practices and supporting local producers.',
            ),
            const SizedBox(height: 25),

            _buildSectionTitle('Our Team'),
            const SizedBox(height: 10),
            _buildSectionText(
              'Our team consists of passionate chefs, friendly waitstaff, and dedicated managers '
              'who work together to ensure every customer has a memorable experience.',
            ),
            const SizedBox(height: 25),

            _buildSectionTitle('Contact Information'),
            const SizedBox(height: 15),
            _buildContactInfo(
              Icons.location_on,
              '123 Restaurant St, Food City',
            ),
            _buildContactInfo(Icons.phone, '+966 12 345 6789'),
            _buildContactInfo(Icons.email, 'info@restaurant.com'),
            _buildContactInfo(
              Icons.access_time,
              'Open daily from 10:00 AM to 11:00 PM',
            ),

            const SizedBox(height: 30),
            Center(
              child: Text(
                '© 2023 Restaurant App. All rights reserved.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
