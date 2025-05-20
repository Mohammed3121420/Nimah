// lib/utils/navigation_handler.dart
import 'package:flutter/material.dart';

import '../screen/about_us_screen.dart';
import '../screen/contact_us_screen.dart';
import '../screen/edit_profile_screen.dart';
import '../screen/language_screen.dart';
import '../screen/payment_screen.dart';

class NavigationHandler {
  static void handleOptionTap(String optionTitle, BuildContext context) {
    switch (optionTitle) {
      case 'My Profile':
        _navigateTo(context, const EditProfileScreen());
        break;
      case 'About Us':
        _navigateTo(context, const AboutUsScreen());
        break;
      case 'Language':
        _navigateTo(context, const LanguageScreen());
        break;
      case 'Payments Methods':
        _navigateTo(context, const PaymentScreen());
        break;
      case 'Contact Us':
        _navigateTo(context, const ContactUsScreen());
        break;
      // case 'Log out':
      //   break;
      default:
        break;
    }
  }

  static void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
