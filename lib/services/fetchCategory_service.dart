// api_service.dart
import 'dart:convert';
import 'package:damasauction/models/category/category_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = 'https://api.mazaddimashq.com/api/category/inside-page';

  Future<List<Attribute>> fetchCategoryDetails(int categoryId) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization':
              'Bearer YOUR_API_TOKEN', // Replace with your actual token
          'Content-Type': 'application/json',
        },
        body: json.encode({'category_id': categoryId}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data'] as List)
            .map((attribute) => Attribute.fromJson(attribute))
            .toList();
      } else {
        throw Exception(
            'Failed to load category details: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
