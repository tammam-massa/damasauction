import 'package:damasauction/views/ads/choose_ad_info.dart';

import 'package:damasauction/widgets/ads/categoryadname.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:damasauction/widgets/shared/searchbartop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChooseAdCategoryPage extends StatefulWidget {
  const ChooseAdCategoryPage({super.key});

  @override
  ChooseAdCategoryPageState createState() => ChooseAdCategoryPageState();
}

class ChooseAdCategoryPageState extends State<ChooseAdCategoryPage> {
  String? _selectedCategory; // To track the selected category
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories when the widget is initialized
  }

// Fetching categories from the API
  Future<void> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          categories = data['data'];
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // Handle any exceptions (like network issues) here
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), // Curved edges for the whole page
          ),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button with Text
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left_outlined,
                            color: Colors.black),
                        onPressed: () {
                          // Handle back action
                          Get.back();
                        },
                      ),
                      Text(
                        'back'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Progress bar
                  LinearProgressIndicator(
                    minHeight: 10,
                    value: 0.33, // Adjust according to the step
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff358cde)),
                  ),
                  const SizedBox(height: 10),
                  // "Step 1" text under the progress bar
                  Text(
                    "step 1".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // "Choose Category" text
                  Text(
                    'choose_category'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SearchBarTop(),
                  const SizedBox(height: 20),
                  // Category list with Radio Buttons
                  Expanded(
                    child: categories.isEmpty
                        ? const Center(
                            child:
                                CircularProgressIndicator()) // Loading indicator
                        : ListView(
                            children: categories.map((category) {
                              // Assuming 'name' holds the category name
                              String categoryName = category['name'];

                              return CategoryAdName(
                                category:
                                    categoryName, // Pass the name explicitly as String
                                selectedCategory: _selectedCategory,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCategory =
                                        value; // Update the selected category
                                  });
                                },
                              );
                            }).toList(),
                          ),
                  ),

                  const SizedBox(height: 20),
                  // Next Button
                  SizedBox(
                      width: double.infinity,
                      child: ActionButton(
                        text: 'next'.tr,
                        iconData: Icons.next_plan,
                        onPressed: () {
                          Get.to(ChooseAdInfoPage());
                        },
                        backgroundColor: const Color(0xff358cde),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
