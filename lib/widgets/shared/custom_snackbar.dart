import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void showSnackbar({
    required String title,
    required String message,
    required IconData icon,
  }) {
    Get.snackbar(
      title.tr,
      message.tr,
      backgroundColor: const Color(0xFF000000), // Background color
      colorText: const Color(0xFFffffff), // Text color
      icon: Icon(
        icon, // Add the provided icon
        color: const Color(0xFFffffff), // Icon color
      ),
      snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
      borderRadius: 12, // Rounded corners
      margin: const EdgeInsets.all(16), // Padding around the snackbar
      duration: const Duration(seconds: 3), // Duration to show the snackbar
    );
  }
}
