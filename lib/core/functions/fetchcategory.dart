import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http; // Import the http package

Future<List<dynamic>> fetchCategories() async {
  try {
    final response = await http
        .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Print the response to check its structure

      return data['data'] ?? []; // Return the categories directly
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    print(e); // Log network errors

    // Show an error message to the user
    Get.snackbar(
      'Error',
      'Failed to load categories',
      backgroundColor: const Color(0xFF000000),
      colorText: const Color(0xFFffffff),
      icon: const Icon(
        Icons.error_outline,
        color: Color(0xFFffffff),
      ),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );

    return []; // Return an empty list on error
  }
}
