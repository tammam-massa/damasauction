// import 'package:damasauction/constructionpage.dart';
// import 'package:damasauction/controllers/home/home_controller.dart';
// import 'package:damasauction/widgets/home/auctioncard.dart';
// import 'package:damasauction/widgets/home/categoryitemcard.dart';
// import 'package:damasauction/widgets/home/categorytitle.dart';
// import 'package:damasauction/widgets/home/customslider.dart';
// import 'package:damasauction/widgets/home/paidad.dart';
// import 'package:damasauction/widgets/home/standardcard.dart';
// import 'package:damasauction/widgets/shared/customdrawer.dart';
// import 'package:damasauction/widgets/shared/searchbartop.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // Home Page
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         scrolledUnderElevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.grey),
//         title: const Text(
//           'Mazad Dimashq',
//           style: TextStyle(color: Colors.grey),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none_outlined),
//             color: Colors.grey,
//             onPressed: () {
//               // Notification action can be added here
//             },
//           ),
//         ],
//       ),
//       backgroundColor: Colors.white,
//       drawer: const CustomDrawer(
//         title: 'Category',
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             // Full-width search bar
//             const SearchBarTop(),
//             const SizedBox(height: 20),
//             // Slider
//              TPromeSlider(
//               banners: const [
//                 'assets/images/banner1.jpg',
//                 'assets/images/banner2.jpg',
//                 'assets/images/banner3.jpg',
//               ],
//               title: 'paid ad'.tr,
//             ),
//             const SizedBox(height: 20),
//             // Live Auction Cards
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Live Auction',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         AuctionCard(
//                           imagePath: 'assets/images/car.jpg',
//                           title: 'Land Cruiser GX-R 4.0L',
//                           time: '12:34 PM',
//                           auctionNumber: 0,
//                           price: '5000.000 SYP',
//                           timeIcon: Icons.timer, // Custom time icon
//                           auctionIcon: Icons.gavel, // Custom auction icon
//                           priceIcon: Icons.money, // Custom price icon
//                           timeColor: Colors.blue, // Custom time color
//                           auctionIconColor:
//                               Colors.green, // Custom auction color
//                           priceIconColor: Colors.orange, // Custom price color
//                         ),
//                         const SizedBox(width: 10),
//                         AuctionCard(
//                           imagePath: 'assets/images/car.jpg',
//                           title: 'Land Cruiser GX-R 4.0L',
//                           time: '12:34 PM',
//                           auctionNumber: 0,
//                           price: '5000.000 SYP',
//                           timeIcon: Icons.timer, // Custom time icon
//                           auctionIcon: Icons.gavel, // Custom auction icon
//                           priceIcon: Icons.money, // Custom price icon
//                           timeColor: Colors.blue, // Custom time color
//                           auctionIconColor:
//                               Colors.green, // Custom auction color
//                           priceIconColor: Colors.orange, // Custom price color
//                         ),
//                         const SizedBox(width: 10),
//                         AuctionCard(
//                           imagePath: 'assets/images/car.jpg',
//                           title: 'Land Cruiser GX-R 4.0L',
//                           time: '12:34 PM',
//                           auctionNumber: 0,
//                           price: '5000.000 SYP',
//                           timeIcon: Icons.timer, // Custom time icon
//                           auctionIcon: Icons.gavel, // Custom auction icon
//                           priceIcon: Icons.money, // Custom price icon
//                           timeColor: Colors.blue, // Custom time color
//                           auctionIconColor:
//                               Colors.green, // Custom auction color
//                           priceIconColor: Colors.orange, // Custom price color
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Real estate cards
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CategoryTitle(
//                     categoryName: 'Real State',
//                     adsCount: '2000 ads',
//                   ),
//                   const SizedBox(height: 10),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         StandardCard(
//                           imagePath: 'assets/images/property.png',
//                           bgColor: const Color(
//                               0xffFDE1CC), // Use 'const' for the color object
//                           onTap: () {
//                             Get.to(ConstructionPage()); // Navigation using GetX
//                           },
//                           title: 'Property',
//                         ),
//                         const SizedBox(width: 10),
//                         StandardCard(
//                           title: 'Lands',
//                           imagePath: 'assets/images/lands.png',
//                           bgColor: const Color(0xFFD9F0B8),
//                           onTap: () {
//                             // Handle tap event for Lands card
//                             print('Lands card tapped');
//                           },
//                         ),
//                         const SizedBox(width: 10),
//                         StandardCard(
//                           title: 'Furniture',
//                           imagePath: 'assets/images/furniture.png',
//                           bgColor: Colors.pink[
//                               100]!, // Safely unwrapping nullable value with "!"
//                           onTap: () {
//                             // Handle tap event for Furniture card
//                             print('Furniture card tapped');
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Family needs section
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CategoryTitle(
//                     categoryName: 'Family needs',
//                     adsCount: '50000',
//                   ),
//                   const SizedBox(height: 10),
//                   GridView(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3, // 3 columns grid layout
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 8,
//                       childAspectRatio: 2 /
//                           3, // Adjust the aspect ratio for rectangular items
//                     ),
//                     shrinkWrap: true,
//                     physics:
//                         const NeverScrollableScrollPhysics(), // Disable scroll to fit in the main page scroll
//                     children: [
//                       // First row
//                       const CategoryItemCard(
//                         title: "Job Vacancies",
//                         imagePath: "assets/images/furniture.png",
//                         color: Colors.grey,
//                         rowSpan: 1,
//                         colSpan: 1,
//                       ),
//                       const CategoryItemCard(
//                         title: "Job Seekers",
//                         imagePath: "assets/images/furniture.png",
//                         color: Colors.blue,
//                         rowSpan: 2,
//                         colSpan: 1,
//                       ),

//                       // Second row
//                       CategoryItemCard(
//                         title: "Men stuff",
//                         imagePath: "assets/images/furniture.png",
//                         color: Colors.yellow[100]!,
//                         rowSpan: 1,
//                         colSpan: 1,
//                       ),
//                       CategoryItemCard(
//                         title: "Women stuff",
//                         imagePath: "assets/images/furniture.png",
//                         color: Colors.orange[100]!,
//                         rowSpan: 1,
//                         colSpan: 1,
//                       ),
//                       CategoryItemCard(
//                         title: "Kids stuff",
//                         imagePath: "assets/images/furniture.png",
//                         color: Colors.brown[100]!,
//                         rowSpan: 1,
//                         colSpan: 1,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             // Vehicles Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CategoryTitle(
//                     categoryName: 'Vehicles',
//                     adsCount: '58000',
//                   ),
//                   const SizedBox(height: 20),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             // Rent Cars card with fixed width
//                             SizedBox(
//                               width: 100, // Fixed width for Rent Cars
//                               child: _buildCategoryCard(
//                                 'Rent Cars',
//                                 'assets/images/furniture.png',
//                                 Colors.blue.shade100,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             // Offshore Tools card with bigger width
//                             Expanded(
//                               child: _buildCategoryCardBig(
//                                 'Offshore Tools',
//                                 'assets/images/lands.png',
//                                 Colors.grey.shade200,
//                                 300, // Custom width for Offshore Tools
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildCategoryCard(
//                                 'Spare Parts',
//                                 'assets/images/furniture.png',
//                                 Colors.green.shade100,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildCategoryCard(
//                                 'Mzad Yard',
//                                 'assets/images/furniture.png',
//                                 Colors.purple.shade100,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildCategoryCard(
//                                 'Mzad Yard',
//                                 'assets/images/furniture.png',
//                                 Colors.purple.shade100,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const PaidAd(bannerImage: 'assets/images/banner1.jpg'),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // Vehicles Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Vehicles',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         '29838 Ads',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 10),
//                         // Second row moved to the first position
//                         Row(
//                           children: [
//                             Expanded(
//                               child: _buildCategoryCard(
//                                 'Spare Parts',
//                                 'assets/images/furniture.png',
//                                 Colors.green.shade100,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildCategoryCard(
//                                 'Mzad Yard',
//                                 'assets/images/furniture.png',
//                                 Colors.purple.shade100,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: _buildCategoryCard(
//                                 'Mzad Yard',
//                                 'assets/images/furniture.png',
//                                 Colors.purple.shade100,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         // First row moved to the second position
//                         Row(
//                           children: [
//                             // Rent Cars card with fixed width
//                             SizedBox(
//                               width: 100, // Fixed width for Rent Cars
//                               child: _buildCategoryCard(
//                                 'Rent Cars',
//                                 'assets/images/furniture.png',
//                                 Colors.blue.shade100,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             // Offshore Tools card with bigger width
//                             Expanded(
//                               child: _buildCategoryCardBig(
//                                 'Offshore Tools',
//                                 'assets/images/lands.png',
//                                 Colors.grey.shade200,
//                                 300, // Custom width for Offshore Tools
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const PaidAd(bannerImage: 'assets/images/banner1.jpg'),
//                 ],
//               ),
//             ),
//             // Services cards with two rows, each containing 3 cards
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CategoryTitle(
//                     categoryName: 'Services',
//                     adsCount: '58800 ads',
//                   ),
//                   SizedBox(height: 10),
//                   Column(
//                     children: [
//                       // First row with 3 cards
//                       Row(
//                         children: [
//                           // Expanded(
//                           //   child: buildRealEstateCard(
//                           //     'Property',
//                           //     'assets/images/property.png',
//                           //     const Color(0xffFDE1CC),
//                           //     () {
//                           //       // Handle tap event for Property card
//                           //       print('Property card tapped');
//                           //     },
//                           //   ),
//                           // ),
//                           SizedBox(width: 10),
//                           //     Expanded(
//                           //       child: buildRealEstateCard(
//                           //         'Lands',
//                           //         'assets/images/lands.png',
//                           //         const Color(0xFFD9F0B8),
//                           //         () {
//                           //           // Handle tap event for Property card
//                           //           print('Property card tapped');
//                           //         },
//                           //       ),
//                           //     ),
//                           //     const SizedBox(width: 10),
//                           //     Expanded(
//                           //       child: buildRealEstateCard(
//                           //         'Furniture',
//                           //         'assets/images/furniture.png',
//                           //         Colors.pink[100]!,
//                           //         () {
//                           //           // Handle tap event for Property card
//                           //           print('Property card tapped');
//                           //         },
//                           //       ),
//                           //     ),
//                           //   ],
//                           // ),
//                           // const SizedBox(height: 10),
//                           // // Second row with 3 cards
//                           // Row(
//                           //   children: [
//                           //     Expanded(
//                           //       child: buildRealEstateCard(
//                           //         'More Categories',
//                           //         'assets/images/furniture.png',
//                           //         Colors.blue[100]!,
//                           //         () {
//                           //           // Handle tap event for Property card
//                           //           print('Property card tapped');
//                           //         },
//                           //       ),
//                           //     ),
//                           //     const SizedBox(width: 10),
//                           //     Expanded(
//                           //       child: buildRealEstateCard(
//                           //         'Rentals',
//                           //         'assets/images/furniture.png',
//                           //         Colors.orange[100]!,
//                           //         () {
//                           //           // Handle tap event for Property card
//                           //           print('Property card tapped');
//                           //         },
//                           //       ),
//                           //     ),
//                           //     const SizedBox(width: 10),
//                           //     Expanded(
//                           //       child: buildRealEstateCard(
//                           //         'Commercial',
//                           //         'assets/images/furniture.png',
//                           //         Colors.green[100]!,
//                           //         () {
//                           //           // Handle tap event for Property card
//                           //           print('Property card tapped');
//                           //         },
//                           //       ),
//                           //     ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // Normal category card method
//   Widget _buildCategoryCard(
//     String title,
//     String imagePath,
//     Color bgColor,
//   ) {
//     return Container(
//       height: 150, // Define the height explicitly to avoid layout issues
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           // Position text in the top-left corner
//           Positioned(
//             top: 12,
//             left: 5,
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           // Positioned image in the bottom-right corner
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(imagePath, height: 70),
//           ),
//         ],
//       ),
//     );
//   }

//   // New method for Offshore Tools with a bigger width and image in the extreme bottom-right
//   Widget _buildCategoryCardBig(
//     String title,
//     String imagePath,
//     Color bgColor,
//     double width, // Custom width parameter
//   ) {
//     return Container(
//       width: width, // Set the width for the big card
//       height: 150, // Define the height explicitly to avoid layout issues
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: bgColor,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           // Position text in the top-left corner
//           Positioned(
//             top: 16,
//             left: 16,
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           // Positioned image in the extreme bottom-right corner
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               imagePath,
//               height: 100, // Adjust the height as necessary
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
