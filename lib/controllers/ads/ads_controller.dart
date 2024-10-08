import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChooseAdInfoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final nameController = TextEditingController();
  final startingPriceController = TextEditingController();
  final minIncreasePriceController = TextEditingController();
  final descriptionController = TextEditingController();
  final keywordsController = TextEditingController();
  final biddingStartTimeController = TextEditingController();
  final attributesController = TextEditingController();

  RxList<dynamic> categories = [].obs; // Using RxList for reactive state
  RxString selectedCategory = ''.obs; // Default category
  RxString selectedCity = ''.obs; // Default city
  RxBool isLoading = true.obs; // Loading indicator
  RxList<String> photos = <String>[].obs; // List of uploaded photos

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Fetch categories when the controller is initialized
  }

  // Fetching categories from the API
  Future<void> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        categories.value = List<Map<String, dynamic>>.from(data['data']);
        // Ensure unique categories
        final uniqueIds = <String>{};
        categories.retainWhere(
            (category) => uniqueIds.add(category['id'].toString()));

        // Set default category if available
        if (categories.isNotEmpty) {
          selectedCategory.value = categories.first['id'].toString();
        }
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false; // Stop the loading indicator
    }
  }

  // Submit form data
  void submitForm() {
    if (formKey.currentState!.validate()) {
      // Prepare the item data
      Map<String, dynamic> itemData = {
        'category_id': selectedCategory.value,
        'city_id': selectedCity.value,
        'name': nameController.text,
        'starting_price': startingPriceController.text,
        'min_increase_price': minIncreasePriceController.text,
        'description': descriptionController.text,
        'keywords': keywordsController.text,
        'bidding_start_time': biddingStartTimeController.text,
        'attributes':
            attributesController.text.split(','), // Example: ["1", "black"]
        'photos': photos // This should be an array of uploaded images
      };

      // Send the data (e.g., through an API call)
      print(itemData); // Replace with actual API call logic
    }
  }
}
