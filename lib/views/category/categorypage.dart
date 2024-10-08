//previous is ok

import 'package:damasauction/controllers/category/category_controller.dart';
import 'package:damasauction/services/category_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  final int categoryId;

  const CategoryPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final CategoryController categoryController = Get.put(CategoryController());

    // Fetch the category details when the widget is built
    categoryController.fetchCategoryDetails(categoryId);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F5F5),
        title: Row(
          children: [
            // IconButton for back navigation
            IconButton(
              icon:
                  const Icon(Icons.chevron_left_outlined, color: Colors.black),
              onPressed: () {
                Get.back(); // Handle back action
              },
            ),
            Expanded(
              // FutureBuilder to display category name
              child: FutureBuilder<String?>(
                future: getCategoryNameById(categoryId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('جاري التحميل ....'); // Loading state
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}'); // Error state
                  } else {
                    final categoryName = snapshot.data ?? 'Category not found';
                    return Text(
                      categoryName,
                      style:
                          const TextStyle(color: Colors.black), // Category name
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (categoryController.categoryModel.value.attributes.isEmpty) {
          return const Center(
              child: Text('No attributes found for this category.'));
        } else {
          // Render the category details here
          return ListView.builder(
            itemCount: categoryController.categoryModel.value.attributes.length,
            itemBuilder: (context, index) {
              final attribute =
                  categoryController.categoryModel.value.attributes[index];

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Attribute name in a styled rectangle
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text(
                        attribute.attributeName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 10), // Space between attribute name and options
                    // Options displayed as cards
                    Wrap(
                      spacing: 10.0, // Space between cards
                      children: attribute.attributeTypeList.map((option) {
                        return GestureDetector(
                          onTap: () {
                            // Handle selection logic here
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                option.option,
                                style: const TextStyle(
                                    color: Colors.black), // Text color
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
