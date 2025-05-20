import 'package:flutter/material.dart';

import '../widget/navigation_handler.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange[100],
              child: Icon(Icons.person, size: 50, color: Colors.orange),
            ),

            const SizedBox(height: 20),

            //! راح يتغير الى اسم المستخدم
            const Text(
              'Salman',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            //! راح يتغير الى بريد المستخدم
            Text(
              'Salman@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            const SizedBox(height: 40),

            _buildProfileOption(
              Icons.person_outline,
              'My Profile',
              context: context,
            ),
            _buildDivider(),
            _buildProfileOption(
              Icons.info_outline,
              'About Us',
              context: context,
            ),
            _buildDivider(),
            _buildProfileOption(Icons.language, 'Language', context: context),
            _buildDivider(),
            _buildProfileOption(
              Icons.credit_card,
              'Payments Methods',
              context: context,
            ),
            _buildDivider(),
            _buildProfileOption(
              Icons.contact_support,
              'Contact Us',
              context: context,
            ),
            _buildDivider(),
            _buildProfileOption(
              Icons.logout,
              'Log out',
              isLogout: true,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    IconData icon,
    String title, {
    bool isLogout = false,
    required BuildContext context, 
  }) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.orange),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        NavigationHandler.handleOptionTap(title, context);
      },
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 20,
      endIndent: 20,
    );
  }
}
