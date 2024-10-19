// services/category_function.dart

import 'dart:convert';
import 'package:damasauction/models/category/category_model.dart';
import 'package:http/http.dart' as http;

// Function to fetch category name by ID
Future<String?> getCategoryNameById(int categoryId) async {
  const String baseUrl = 'https://api.mazaddimashq.com/api/category';

  try {
    final response = await http
        .post(Uri.parse('$baseUrl/category-info?category_id=$categoryId'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print('API Response: $jsonResponse'); // Log the API response
      if (jsonResponse['success']) {
        final category = CategoryModel.fromJson(jsonResponse['data']);
        return category.name; // Return the category name
      }
    } else {
      print('Error: ${response.statusCode}'); // Log non-200 response status
    }
  } catch (e) {
    print('Error: $e'); // Handle error appropriately
  }
  return null; // Return null if there's an error or category not found
}
