import 'dart:math';
import 'package:damasauction/views/category/categorypage.dart';
import 'package:damasauction/widgets/home/bigcard.dart';
import 'package:damasauction/widgets/home/full_width_card.dart';
import 'package:damasauction/widgets/home/standardcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final dynamic category;

  CategoryCard({super.key, required this.category});

  String baseUrl = "https://api.mazaddimashq.com/images/original/";
  String defaultImage = "https://via.placeholder.com/150"; // Default image path

  // List of background images for Standard and Big cards
  final List<String> standardCardAssets = [
    'assets/images/1.png', // Replace with your actual image assets
    'assets/images/2.png',
    'assets/images/3.png'
  ];

  final List<String> bigCardAssets = [
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png'
  ];

  // Random generator
  final Random random = Random();

  // Function to randomly pick an image for standard and big cards
  String getRandomImage(List<String> assetList) {
    return assetList[random.nextInt(assetList.length)];
  }

  // Function to get image path with a fallback to the default image
  String getImagePath(String? photo) {
    if (photo != null && photo.isNotEmpty) {
      return "$baseUrl$photo"; // Return the constructed URL if valid
    } else {
      return defaultImage; // Return default image if photo is null or empty
    }
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
        imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
        bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]),
      ));
    } else if (subcategoryCount == 2) {
      cards.add(StandardCard(
        title: subcategories[0]['name'],
        imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
        bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]),
      ));
      cards.add(BigCard(
        title: subcategories[1]['name'],
        imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
        bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[1]['category_id'], subcategories[1]),
      ));
    } else if (subcategoryCount == 3) {
      for (int i = 0; i < subcategoryCount; i++) {
        cards.add(StandardCard(
          title: subcategories[i]['name'],
          imagePath:
              getImagePath(subcategories[i]['photo']), // Use getImagePath
          bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
          onTap: () => navigateToCategoryPage(
              subcategories[i]['category_id'], subcategories[i]),
        ));
      }
    } else if (subcategoryCount == 4) {
      cards.add(BigCard(
        title: subcategories[0]['name'],
        imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
        bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]),
      ));
      cards.add(StandardCard(
        title: subcategories[1]['name'],
        imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
        bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[1]['category_id'], subcategories[1]),
      ));
      cards.add(BigCard(
        title: subcategories[2]['name'],
        imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
        bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[2]['category_id'], subcategories[2]),
      ));
      cards.add(StandardCard(
        title: subcategories[3]['name'],
        imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
        bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[3]['category_id'], subcategories[3]),
      ));
    } else if (subcategoryCount == 5) {
      cards.add(StandardCard(
        title: subcategories[0]['name'],
        imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
        bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[0]['category_id'], subcategories[0]),
      ));
      cards.add(BigCard(
        title: subcategories[1]['name'],
        imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
        bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
        onTap: () => navigateToCategoryPage(
            subcategories[1]['category_id'], subcategories[1]),
      ));
      for (int i = 2; i < subcategoryCount; i++) {
        cards.add(StandardCard(
          title: subcategories[i]['name'],
          imagePath:
              getImagePath(subcategories[i]['photo']), // Use getImagePath
          bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
          onTap: () => navigateToCategoryPage(
              subcategories[i]['category_id'], subcategories[i]),
        ));
      }
    } else if (subcategoryCount == 6) {
      for (int i = 0; i < subcategoryCount; i++) {
        cards.add(StandardCard(
          title: subcategories[i]['name'],
          imagePath:
              getImagePath(subcategories[i]['photo']), // Use getImagePath
          bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
          onTap: () => navigateToCategoryPage(
              subcategories[i]['category_id'], subcategories[i]),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Container(
        color: Colors.white, // White background for the category
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                category['name'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Wrap(
                spacing: 2.0,
                runSpacing: 2.0,
                children: cards,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
