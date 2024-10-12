import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/attribute/attribute.dart';

Future<List<Attribute>> fetchAttributes(int categoryId) async {
  final response = await http.get(Uri.parse(
      'https://api.mazaddimashq.com/api/category/inside-page?category_id=$categoryId'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['success']) {
      List<Attribute> attributes = (data['data'] as List)
          .map((attribute) => Attribute.fromJson(attribute))
          .toList();
      return attributes;
    } else {
      throw Exception('Failed to load attributes: ${data['message']}');
    }
  } else {
    throw Exception('Failed to load attributes: ${response.reasonPhrase}');
  }
}
