import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON handling
import 'package:get/get.dart'; // Import for GetX snackbar

Future<void> fetchCategories(List<dynamic> categories) async {
  try {
    final response = await http
        .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Print the response to check its structure

      // Update the categories list
      categories.clear(); // Clear existing categories
      categories.addAll(data['data'] ?? []); // Add new categories
    } else {
      throw Exception('failed_to_load_categories'); // Simplified for standalone
    }
  } catch (e) {
    print(e); // Log network errors

    // Show an error message to the user
    Get.snackbar(
      'Error', // Static error title
      'Failed to load categories', // Static error message
      backgroundColor: const Color(0xFF000000), // Background color
      colorText: const Color(0xFFffffff), // Text color
      icon: const Icon(
        Icons.error_outline, // Add an icon
        color: Color(0xFFffffff), // Icon color
      ),
      snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
      borderRadius: 12, // Rounded corners
      margin: const EdgeInsets.all(16), // Padding around the snackbar
      duration: const Duration(seconds: 3), // Duration to show the snackbar
    );
  }
}
