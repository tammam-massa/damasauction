// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});
//   String baseUrl = "api.mazaddimadhq.com/images/orginal/";
//   // Function to generate a random color with transparency
//   Color getRandomColor() {
//     Random random = Random();
//     return Color.fromRGBO(
//       random.nextInt(256), // Red
//       random.nextInt(256), // Green
//       random.nextInt(256), // Blue
//       0.3, // Alpha (transparency)
//     );
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         //   width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: ${baseUrl}${photo},
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         // width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         //  width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: ${baseUrl}${photo},
//         bgColor: getRandomColor(), // Use random color
//         // width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: ${baseUrl}${photo},
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: ${baseUrl}${photo},
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});
//   String baseUrl = "https://api.mazaddimadhq.com/images/orginal/";
// // Corrected base URL with https

//   // Function to generate a random color with transparency
//   Color getRandomColor() {
//     Random random = Random();
//     return Color.fromRGBO(
//       random.nextInt(256), // Red
//       random.nextInt(256), // Green
//       random.nextInt(256), // Blue
//       0.3, // Alpha (transparency)
//     );
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: "$baseUrl${subcategories[0]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: "$baseUrl${subcategories[0]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: "$baseUrl${subcategories[1]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         //   width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: "$baseUrl${subcategories[i]['photo']}",
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: "$baseUrl${subcategories[0]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         // width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: "$baseUrl${subcategories[1]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: "$baseUrl${subcategories[2]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         //  width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: "$baseUrl${subcategories[3]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: "$baseUrl${subcategories[0]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: "$baseUrl${subcategories[1]['photo']}",
//         bgColor: getRandomColor(), // Use random color
//         // width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: "$baseUrl${subcategories[i]['photo']}",
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: "$baseUrl${subcategories[i]['photo']}",
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});
//   String baseUrl = "https://api.mazaddimadhq.com/images/Orginal/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // Function to generate a random color with transparency
//   Color getRandomColor() {
//     Random random = Random();
//     return Color.fromRGBO(
//       random.nextInt(256), // Red
//       random.nextInt(256), // Green
//       random.nextInt(256), // Blue
//       0.3, // Alpha (transparency)
//     );
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgColor: getRandomColor(), // Use random color
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgColor: getRandomColor(), // Use random color
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }
//prevous is good

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimadhq.com/images/Orginal/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.PNG', // Replace with your actual image assets
//     'assets/images/2.PNG',
//     'assets/images/3.PNG'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.PNG',
//     'assets/images/5.PNG',
//     'assets/images/6.PNG'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         //  width: 0,
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use random image for background
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use random image for background
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use random image for background
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimadhq.com/images/Orginal/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.PNG', // Replace with your actual image assets
//     'assets/images/2.PNG',
//     'assets/images/3.PNG'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.PNG',
//     'assets/images/5.PNG',
//     'assets/images/6.PNG'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use random image for background
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage:
//             getRandomImage(bigCardAssets), // Use random image for background
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use random image for background
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use random image for background
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimadhq.com/images/Orginal/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.PNG', // Replace with your actual image assets
//     'assets/images/2.PNG',
//     'assets/images/3.PNG'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.PNG',
//     'assets/images/5.PNG',
//     'assets/images/6.PNG'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print("Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(bigCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(bigCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//           onTap: () => navigateToCategoryPage(subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(bigCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(bigCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: Image.asset(getRandomImage(bigCardAssets)), // Use Image.asset for background
//         onTap: () => navigateToCategoryPage(subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//           onTap: () => navigateToCategoryPage(subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath: getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: Image.asset(getRandomImage(standardCardAssets)), // Use Image.asset for background
//           onTap: () => navigateToCategoryPage(subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox.shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimadhq.com/images/Orginal/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.png', // Replace with your actual image assets
//     'assets/images/2.png',
//     'assets/images/3.png'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.png',
//     'assets/images/5.png',
//     'assets/images/6.png'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             bigCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             bigCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use getRandomImage to set the background image
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             bigCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             bigCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]), // Add onTap
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]), // Add onTap
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             standardCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]), // Add onTap
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(
//             bigCardAssets), // Use getRandomImage to set the background image
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]), // Add onTap
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use getRandomImage to set the background image
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(
//               standardCardAssets), // Use getRandomImage to set the background image
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]), // Add onTap
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             category['name'],
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//         if (cards.isNotEmpty)
//           Wrap(
//             spacing: 16.0,
//             runSpacing: 16.0,
//             children: cards,
//           ),
//       ],
//     );
//   }
// }
//brfore the end version

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimashq.com/images/original/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.png', // Replace with your actual image assets
//     'assets/images/2.png',
//     'assets/images/3.png'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.png',
//     'assets/images/5.png',
//     'assets/images/6.png'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]),
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]),
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Container(
//       color: Colors.white, // White background for each category group
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               category['name'],
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           if (cards.isNotEmpty)
//             Wrap(
//               spacing: 15.0, // No extra spacing between the cards
//               runSpacing: 15.0, // No extra run spacing between the rows
//               children: cards,
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimashq.com/images/original/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.png', // Replace with your actual image assets
//     'assets/images/2.png',
//     'assets/images/3.png'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.png',
//     'assets/images/5.png',
//     'assets/images/6.png'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]),
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]),
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Padding(
//       padding: const EdgeInsets.all(
//           10), // Uniform padding (same for left, right, and top)
//       child: Center(
//         child: Container(
//           width: double.infinity,
//           color: const Color.fromARGB(
//               255, 190, 186, 186), // White background for main category
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             verticalDirection: VerticalDirection.down,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   category['name'],
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               if (cards.isNotEmpty)
//                 Wrap(
//                   spacing: 5.0, // Spacing between cards
//                   runSpacing: 5.0, // Spacing between rows
//                   children: cards,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:math';
// import 'package:damasauction/views/category/categorypage.dart';
// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/full_width_card.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryCard extends StatelessWidget {
//   final dynamic category;

//   CategoryCard({super.key, required this.category});

//   String baseUrl = "https://api.mazaddimashq.com/images/original/";
//   String defaultImage = "https://via.placeholder.com/150"; // Default image path

//   // List of background images for Standard and Big cards
//   final List<String> standardCardAssets = [
//     'assets/images/1.png', // Replace with your actual image assets
//     'assets/images/2.png',
//     'assets/images/3.png'
//   ];

//   final List<String> bigCardAssets = [
//     'assets/images/4.png',
//     'assets/images/5.png',
//     'assets/images/6.png'
//   ];

//   // Random generator
//   final Random random = Random();

//   // Function to randomly pick an image for standard and big cards
//   String getRandomImage(List<String> assetList) {
//     return assetList[random.nextInt(assetList.length)];
//   }

//   // Function to get image path with a fallback to the default image
//   String getImagePath(String? photo) {
//     if (photo != null && photo.isNotEmpty) {
//       return "$baseUrl$photo"; // Return the constructed URL if valid
//     } else {
//       return defaultImage; // Return default image if photo is null or empty
//     }
//   }

//   List<Widget> generateCards(List subcategories) {
//     List<Widget> cards = [];
//     int subcategoryCount = subcategories.length;

//     // Navigate to the category page
//     void navigateToCategoryPage(int? categoryId, dynamic subcategory) {
//       if (categoryId != null) {
//         Get.to(CategoryPage(categoryId: categoryId));
//       } else {
//         print(
//             "Error: categoryId is null for subcategory: $subcategory"); // Log the full subcategory object
//       }
//     }

//     // Generate cards based on the number of subcategories
//     if (subcategoryCount == 1) {
//       cards.add(FullWidthCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//     } else if (subcategoryCount == 2) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//     } else if (subcategoryCount == 3) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     } else if (subcategoryCount == 4) {
//       cards.add(BigCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(StandardCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[2]['name'],
//         imagePath: getImagePath(subcategories[2]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[2]['category_id'], subcategories[2]),
//       ));
//       cards.add(StandardCard(
//         title: subcategories[3]['name'],
//         imagePath: getImagePath(subcategories[3]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[3]['category_id'], subcategories[3]),
//       ));
//     } else if (subcategoryCount == 5) {
//       cards.add(StandardCard(
//         title: subcategories[0]['name'],
//         imagePath: getImagePath(subcategories[0]['photo']), // Use getImagePath
//         bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[0]['category_id'], subcategories[0]),
//       ));
//       cards.add(BigCard(
//         title: subcategories[1]['name'],
//         imagePath: getImagePath(subcategories[1]['photo']), // Use getImagePath
//         bgImage: getRandomImage(bigCardAssets), // Use getRandomImage
//         onTap: () => navigateToCategoryPage(
//             subcategories[1]['category_id'], subcategories[1]),
//       ));
//       for (int i = 2; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     } else if (subcategoryCount == 6) {
//       for (int i = 0; i < subcategoryCount; i++) {
//         cards.add(StandardCard(
//           title: subcategories[i]['name'],
//           imagePath:
//               getImagePath(subcategories[i]['photo']), // Use getImagePath
//           bgImage: getRandomImage(standardCardAssets), // Use getRandomImage
//           onTap: () => navigateToCategoryPage(
//               subcategories[i]['category_id'], subcategories[i]),
//         ));
//       }
//     }

//     return cards;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List subcategories = category['children'] ?? [];

//     // Debug print the subcategories
//     print("Subcategories: $subcategories");

//     // Check if the category has no subcategories
//     if (subcategories.isEmpty) {
//       return const SizedBox
//           .shrink(); // Don't display the category if there are no children
//     }

//     List<Widget> cards = generateCards(subcategories);

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Text(
//               category['name'],
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Center(
//             child: Wrap(
//               spacing: 15.0,
//               runSpacing: 15.0,
//               children: cards,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
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
