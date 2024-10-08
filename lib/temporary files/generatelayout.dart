// import 'package:damasauction/widgets/home/bigcard.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:flutter/material.dart';

// Widget generateLayout(String mainCategory, List<String> subcategories) {
//   int subcategoryCount = subcategories.length;
//   List<Widget> cards = [];

//   // Add the main category text at the top
//   Widget mainCategoryWidget = Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Text(
//       mainCategory,
//       style: const TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//     ),
//   );

//   // Generate cards based on the number of subcategories
//   if (subcategoryCount == 1) {
//     // One big card
//     cards.add(BigCard(
//       title: subcategories[0],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.blue,
//       width: 200,
//     ));
//   } else if (subcategoryCount == 2) {
//     // One small, one big
//     cards.add(StandardCard(
//       title: subcategories[0],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.blue,
//       onTap: () {},
//     ));
//     cards.add(BigCard(
//       title: subcategories[1],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.blue,
//       width: 200,
//     ));
//   } else if (subcategoryCount == 3) {
//     // Three small cards
//     for (int i = 0; i < subcategoryCount; i++) {
//       cards.add(StandardCard(
//         title: subcategories[i],
//         imagePath: 'assets/image.png',
//         bgColor: Colors.green,
//         onTap: () {},
//       ));
//     }
//   } else if (subcategoryCount == 4) {
//     // One big, one small, one big, one small
//     cards.add(BigCard(
//       title: subcategories[0],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.red,
//       width: 200,
//     ));
//     cards.add(StandardCard(
//       title: subcategories[1],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.yellow,
//       onTap: () {},
//     ));
//     cards.add(BigCard(
//       title: subcategories[2],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.blue,
//       width: 200,
//     ));
//     cards.add(StandardCard(
//       title: subcategories[3],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.yellow,
//       onTap: () {},
//     ));
//   } else if (subcategoryCount == 5) {
//     // One small, one big, three small
//     cards.add(StandardCard(
//       title: subcategories[0],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.green,
//       onTap: () {},
//     ));
//     cards.add(BigCard(
//       title: subcategories[1],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.red,
//       width: 200,
//     ));
//     for (int i = 2; i < subcategoryCount; i++) {
//       cards.add(StandardCard(
//         title: subcategories[i],
//         imagePath: 'assets/image.png',
//         bgColor: Colors.blue,
//         onTap: () {},
//       ));
//     }
//   } else if (subcategoryCount == 6) {
//     // Six small cards
//     for (int i = 0; i < subcategoryCount; i++) {
//       cards.add(StandardCard(
//         title: subcategories[i],
//         imagePath: 'assets/image.png',
//         bgColor: Colors.purple,
//         onTap: () {},
//       ));
//     }
//   } else if (subcategoryCount == 7) {
//     // One small, one big, three small, one big, one small
//     cards.add(StandardCard(
//       title: subcategories[0],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.orange,
//       onTap: () {},
//     ));
//     cards.add(BigCard(
//       title: subcategories[1],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.blue,
//       width: 200,
//     ));
//     for (int i = 2; i < 5; i++) {
//       cards.add(StandardCard(
//         title: subcategories[i],
//         imagePath: 'assets/image.png',
//         bgColor: Colors.green,
//         onTap: () {},
//       ));
//     }
//     cards.add(BigCard(
//       title: subcategories[5],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.red,
//       width: 200,
//     ));
//     cards.add(StandardCard(
//       title: subcategories[6],
//       imagePath: 'assets/image.png',
//       bgColor: Colors.yellow,
//       onTap: () {},
//     ));
//   } else if (subcategoryCount == 8) {
//     // Alternate big and small cards
//     for (int i = 0; i < subcategoryCount; i++) {
//       if (i % 2 == 0) {
//         cards.add(BigCard(
//           title: subcategories[i],
//           imagePath: 'assets/image.png',
//           bgColor: Colors.blue,
//           width: 200,
//         ));
//       } else {
//         cards.add(StandardCard(
//           title: subcategories[i],
//           imagePath: 'assets/image.png',
//           bgColor: Colors.pink,
//           onTap: () {},
//         ));
//       }
//     }
//   } else {
//     // Default handling for more than 8 subcategories
//     for (int i = 0; i < subcategoryCount; i++) {
//       cards.add(StandardCard(
//         title: subcategories[i],
//         imagePath: 'assets/image.png',
//         bgColor: i % 2 == 0 ? Colors.blue : Colors.green,
//         onTap: () {},
//       ));
//     }
//   }

//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       mainCategoryWidget,
//       Wrap(
//         spacing: 10,
//         runSpacing: 10,
//         children: cards,
//       ),
//     ],
//   );
// }
