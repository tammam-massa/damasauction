import 'package:damasauction/views/ads/choose_ads_info.dart';
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

class ChooseAdCategoryPageState extends State<ChooseAdCategoryPage>
    with SingleTickerProviderStateMixin {
  String? _selectedCategoryName; // Track the selected category name
  int? _selectedCategoryId; // Track the selected category ID
  List<dynamic> categories = [];
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories when the widget is initialized

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 1), // Animation duration
      vsync: this,
    );

    // Initialize the animation for the progress bar
    _animation = Tween<double>(begin: 0.0, end: 0.33).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );

    // Start the animation
    _animationController!.forward();
  }

  // Dispose the controller to free up resources
  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
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
                          Get.back(); // Handle back action
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
                  // Animated Progress bar
                  AnimatedBuilder(
                    animation: _animationController!,
                    builder: (context, child) {
                      return LinearProgressIndicator(
                        minHeight: 10,
                        value: _animation?.value, // Use animation for value
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xff358cde)), // Blue color for progress
                      );
                    },
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
                              String categoryName = category['name'];
                              int? categoryId =
                                  category['id']; // Category ID can be null

                              // Handle categoryId null safety
                              if (categoryId != null) {
                                return CategoryAdName(
                                  categoryName: categoryName,
                                  categoryId: categoryId,
                                  selectedCategoryId: _selectedCategoryId,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCategoryId =
                                          value; // Update category ID
                                      _selectedCategoryName =
                                          categoryName; // Update category name
                                    });
                                  },
                                );
                              } else {
                                return Container(); // Handle null categoryId (skip this category)
                              }
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
                        if (_selectedCategoryId != null) {
                          // Navigate to the next page with selected category
                          Get.to(ChooseAdInfoPage(), arguments: {
                            'categoryId': _selectedCategoryId,
                            'categoryName': _selectedCategoryName,
                          });
                        } else {
                          // Show an error if no category is selected
                          Get.snackbar('Error', 'Please select a category');
                        }
                      },
                      backgroundColor: const Color(0xff358cde),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
