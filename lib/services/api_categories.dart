// api_categories.dart
import 'dart:convert';
import 'package:damasauction/models/category/category_model.dart';
import 'package:http/http.dart' as http;

class ApiCategoriesService {
  final String baseUrl = 'https://api.mazaddimashq.com/api/category';

  Future<CategoryModel?> fetchCategoryDetails(int categoryId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/inside-page?category_id=$categoryId'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('API Response: $data'); // Print the entire response for debugging

      if (data['success']) {
        var categoryData = data['data'];
        if (categoryData != null && categoryData.isNotEmpty) {
          return CategoryModel.fromJson(
              categoryData[0]); // Safely access the first category
        } else {
          print('No category data found.');
        }
      } else {
        print('Error: ${data['message']}');
      }
    } else {
      print('Error: ${response.statusCode}');
    }
    return null;
  }
}
