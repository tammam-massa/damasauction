import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> createItem(List<Map<String, dynamic>> attributes) async {
  final response = await http.post(
    Uri.parse('https://api.mazaddimashq.com/api/item/create-item'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'attributes': attributes,
      // Add other necessary fields here
    }),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['success']) {
      print(data['message']); // Handle success
    } else {
      throw Exception('Failed to create item: ${data['message']}');
    }
  } else {
    throw Exception('Failed to create item: ${response.reasonPhrase}');
  }
}
