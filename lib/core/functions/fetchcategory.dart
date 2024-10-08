import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // Import for JSON handling
import 'package:get/get.dart'; // Import for GetX snackbar

// Function to fetch categories
Future<List<String>> fetchCategories() async {
  try {
    final response = await http
        .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

    if (response.statusCode == 200) {
      final List<dynamic> data =
          json.decode(response.body); // Decode the JSON response
      // Extract and return category names as a List of Strings
      return data.map((category) => category['name'] as String).toList();
    } else {
      // Handle error response
      Get.snackbar('Error', 'Failed to load categories');
      return []; // Return an empty list on failure
    }
  } catch (e) {
    // Handle network or parsing errors
    Get.snackbar('Error', 'An error occurred while fetching categories');
    return []; // Return an empty list on exception
  }
}
