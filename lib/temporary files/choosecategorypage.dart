import 'package:damasauction/temporary%20files/chooseadinfo.dart';
import 'package:damasauction/widgets/shared/searchbartop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseCategoryPage extends StatefulWidget {
  const ChooseCategoryPage({super.key});

  @override
  ChooseCategoryPageState createState() => ChooseCategoryPageState();
}

class ChooseCategoryPageState extends State<ChooseCategoryPage> {
  String? _selectedCategory; // To track the selected category

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
                      const Text(
                        'Back',
                        style: TextStyle(
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
                        const AlwaysStoppedAnimation<Color>(Color(0xffFD8F02)),
                  ),
                  const SizedBox(height: 10),
                  // "Step 1" text under the progress bar
                  // Step Label
                  const Text(
                    "Step 1",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // "Choose Category" text
                  const Text(
                    'Choose Category',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Search bar with white background
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Search',
                  //     prefixIcon: Icon(Icons.search), // Search icon
                  //     filled: true,
                  //     fillColor:
                  //         Colors.black12, // White background for search box
                  //     border: OutlineInputBorder(
                  //       borderRadius:
                  //           BorderRadius.circular(12), // Curved search bar
                  //       borderSide: BorderSide.none, // No border
                  //     ),
                  //   ),
                  // ),
                  const SearchBarTop(),
                  const SizedBox(height: 20),
                  // Category list with Radio Buttons
                  Expanded(
                    child: ListView(
                      children: [
                        _buildCategoryItem('Property'),
                        _buildCategoryItem('Lands'),
                        _buildCategoryItem('Furniture'),
                        _buildCategoryItem('Cars'),
                        _buildCategoryItem('Motorcycles'),
                        _buildCategoryItem('Rent cars'),
                        _buildCategoryItem('Offshore Tools'),
                        _buildCategoryItem('Spare parts'),
                        _buildCategoryItem('Heavy equipment'),
                        _buildCategoryItem('Pesticides & Pest Control'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle next action
                        Get.to(const ChooseAdInfoPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffFD8F02), // Button color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Curved button
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
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

  // Category item with Radio Button
  Widget _buildCategoryItem(String category) {
    return RadioListTile(
      value: category,
      groupValue: _selectedCategory,
      onChanged: (value) {
        setState(() {
          _selectedCategory = value; // Update the selected category
        });
      },
      title: Text(
        category,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      activeColor:
          const Color(0xffFD8F02), // Color of the selected radio button
    );
  }
}
