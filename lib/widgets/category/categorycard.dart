import 'dart:math';
import 'package:damasauction/views/category/categorypage.dart';
import 'package:damasauction/widgets/home/bigcard.dart';
import 'package:damasauction/widgets/home/full_width_card.dart';
import 'package:damasauction/widgets/home/standardcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final dynamic category;

  const CategoryCard({super.key, required this.category});

  // Function to generate a random color with transparency
  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      0.3, // Alpha (transparency)
    );
  }

  List<Widget> generateCards(List subcategories) {
    List<Widget> cards = [];
    int subcategoryCount = subcategories.length;

    // Navigate to the category page
    void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
      if (categoryId != null) {
        Get.to(CategoryPage(categoryId: categoryId));
      } else {
        print(
            "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
      }
    }

    // Generate cards based on the number of subcategories
    if (subcategoryCount == 1) {
      cards.add(FullWidthCard(
        title: subcategories[0]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        width: 0,
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]), // Add onTap
      ));
    } else if (subcategoryCount == 2) {
      cards.add(StandardCard(
        title: subcategories[0]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]), // Add onTap
      ));
      cards.add(BigCard(
        title: subcategories[1]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        //   width: 0,
        onTap: () => navigateToCategoryPage(
            subcategories[1]['category_id'], subcategories[1]), // Add onTap
      ));
    } else if (subcategoryCount == 3) {
      for (int i = 0; i < subcategoryCount; i++) {
        cards.add(StandardCard(
          title: subcategories[i]['name'],
          imagePath: 'assets/image.png',
          bgColor: getRandomColor(), // Use random color
          onTap: () => navigateToCategoryPage(
              subcategories[i]['category_id'], subcategories[i]), // Add onTap
        ));
      }
    } else if (subcategoryCount == 4) {
      cards.add(BigCard(
        title: subcategories[0]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        // width: 0,
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]), // Add onTap
      ));
      cards.add(StandardCard(
        title: subcategories[1]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        onTap: () => navigateToCategoryPage(
            subcategories[1]['category_id'], subcategories[1]), // Add onTap
      ));
      cards.add(BigCard(
        title: subcategories[2]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        //  width: 0,
        onTap: () => navigateToCategoryPage(
            subcategories[2]['category_id'], subcategories[2]), // Add onTap
      ));
      cards.add(StandardCard(
        title: subcategories[3]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        onTap: () => navigateToCategoryPage(
            subcategories[3]['category_id'], subcategories[3]), // Add onTap
      ));
    } else if (subcategoryCount == 5) {
      cards.add(StandardCard(
        title: subcategories[0]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]), // Add onTap
      ));
      cards.add(BigCard(
        title: subcategories[1]['name'],
        imagePath: 'assets/image.png',
        bgColor: getRandomColor(), // Use random color
        // width: 0,
        onTap: () => navigateToCategoryPage(
            subcategories[1]['category_id'], subcategories[1]), // Add onTap
      ));
      for (int i = 2; i < subcategoryCount; i++) {
        cards.add(StandardCard(
          title: subcategories[i]['name'],
          imagePath: 'assets/image.png',
          bgColor: getRandomColor(), // Use random color
          onTap: () => navigateToCategoryPage(
              subcategories[i]['category_id'], subcategories[i]), // Add onTap
        ));
      }
    } else if (subcategoryCount == 6) {
      for (int i = 0; i < subcategoryCount; i++) {
        cards.add(StandardCard(
          title: subcategories[i]['name'],
          imagePath: 'assets/image.png',
          bgColor: getRandomColor(), // Use random color
          onTap: () => navigateToCategoryPage(
              subcategories[i]['category_id'], subcategories[i]), // Add onTap
        ));
      }
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    List subcategories = category['children'] ?? [];

    // Debug print the subcategories
    print("Subcategories: $subcategories");

    // Check if the category has no subcategories
    if (subcategories.isEmpty) {
      return const SizedBox
          .shrink(); // Don't display the category if there are no children
    }

    List<Widget> cards = generateCards(subcategories);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category['name'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        if (cards.isNotEmpty)
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: cards,
          ),
      ],
    );
  }
}
