// import 'package:damasauction/controllers/home/home_controller.dart';
// import 'package:damasauction/widgets/home/auctioncard.dart';
// import 'package:damasauction/widgets/home/customslider.dart';
// import 'package:damasauction/widgets/home/paidad.dart';
// import 'package:damasauction/widgets/category/categorycard.dart';
// import 'package:damasauction/widgets/shared/customdrawer.dart';
// import 'package:damasauction/widgets/shared/searchbartop.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // Home Page
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   List<dynamic> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCategories();
//   }

//   // Fetching categories from the API
//   Future<void> fetchCategories() async {
//     final response = await http
//         .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         categories = data['data'];
//       });
//     } else {
//       throw Exception('Failed to load categories');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         scrolledUnderElevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.grey),
//         title: Text(
//           'mazad dimashq'.tr,
//           style: const TextStyle(color: Colors.grey),
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
//       drawer: CustomDrawer(title: 'categories'.tr, categories: categories),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             // Full-width search bar
//             const SearchBarTop(),
//             const SizedBox(height: 20),
//             // Slider
//             TPromeSlider(
//               banners: const [
//                 'assets/images/banner1.jpg',
//                 'assets/images/banner2.jpg',
//                 'assets/images/banner3.jpg',
//               ],
//               title: 'paid ad'.tr,
//             ),
//             const SizedBox(height: 20),

//             // Live Auction Cards
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'live auction'.tr,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         AuctionCard(
//                           imagePath: 'assets/images/car.jpg',
//                           title: 'Land Cruiser GX-R 4.0L',
//                           time: '12:34 PM',
//                           auctionNumber: 0,
//                           price: '5000.000 SYP',
//                           timeIcon: Icons.timer,
//                           auctionIcon: Icons.gavel,
//                           priceIcon: Icons.money,
//                           timeColor: Colors.blue,
//                           auctionIconColor: Colors.green,
//                           priceIconColor: Colors.orange,
//                         ),
//                         SizedBox(width: 10),
//                         AuctionCard(
//                           imagePath: 'assets/images/car.jpg',
//                           title: 'Land Cruiser GX-R 4.0L',
//                           time: '12:34 PM',
//                           auctionNumber: 0,
//                           price: '5000.000 SYP',
//                           timeIcon: Icons.timer,
//                           auctionIcon: Icons.gavel,
//                           priceIcon: Icons.money,
//                           timeColor: Colors.blue,
//                           auctionIconColor: Colors.green,
//                           priceIconColor: Colors.orange,
//                         ),
//                         SizedBox(width: 10),
//                         AuctionCard(
//                           imagePath: 'assets/images/car.jpg',
//                           title: 'Land Cruiser GX-R 4.0L',
//                           time: '12:34 PM',
//                           auctionNumber: 0,
//                           price: '5000.000 SYP',
//                           timeIcon: Icons.timer,
//                           auctionIcon: Icons.gavel,
//                           priceIcon: Icons.money,
//                           timeColor: Colors.blue,
//                           auctionIconColor: Colors.green,
//                           priceIconColor: Colors.orange,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Categories Section
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 // padding: const EdgeInsets.fromLTRB(5, 0, 16, 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // const Text(
//                     //   'Categories',
//                     //   style: TextStyle(
//                     //     color: Colors.grey,
//                     //     fontSize: 16.0,
//                     //     fontWeight: FontWeight.bold,
//                     //   ),
//                     // ),
//                     const SizedBox(height: 10),
//                     categories.isEmpty
//                         ? const Center(child: CircularProgressIndicator())
//                         : ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: categories.length,
//                             itemBuilder: (context, index) {
//                               var category = categories[index];
//                               return category['parent_id'] == null
//                                   ? CategoryCard(category: category)
//                                   : const SizedBox.shrink();
//                             },
//                           ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Paid Ad Section
//             const PaidAd(bannerImage: 'assets/images/banner1.jpg'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:damasauction/controllers/home/home_controller.dart';
// import 'package:damasauction/widgets/home/auctioncard.dart';
// import 'package:damasauction/widgets/home/customslider.dart';
// import 'package:damasauction/widgets/home/paidad.dart';
// import 'package:damasauction/widgets/category/categorycard.dart';
// import 'package:damasauction/widgets/shared/customdrawer.dart';
// import 'package:damasauction/widgets/shared/searchbartop.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // Home Page
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   HomePageState createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   List<dynamic> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCategories();
//   }

//   // Fetching categories from the API
//   Future<void> fetchCategories() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://api.mazaddimashq.com/api/category/all'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           categories = data['data'];
//         });
//       } else {
//         throw Exception('Failed to load categories');
//       }
//     } catch (e) {
//       // Handle any exceptions (like network issues) here
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         scrolledUnderElevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.grey),
//         title: Text(
//           'mazad dimashq'.tr,
//           style: const TextStyle(color: Colors.grey),
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
//       drawer: CustomDrawer(title: 'categories'.tr, categories: categories),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             // Full-width search bar

//             // Slider
//             TPromeSlider(
//               banners: const [
//                 'assets/images/banner1.jpg',
//                 'assets/images/banner2.jpg',
//                 'assets/images/banner3.jpg',
//               ],
//               title: 'paid ad'.tr,
//             ),
//             const SizedBox(height: 20),
//             SearchBarTop(
//               hint: 'search all ads'.tr,
//             ),

//             const SizedBox(height: 20),

//             // Categories Section
//             Padding(
//               padding: const EdgeInsets.all(
//                   16.0), // Consistent padding for categories
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 10),
//                   categories.isEmpty
//                       ? const Center(child: CircularProgressIndicator())
//                       : ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: categories.length,
//                           itemBuilder: (context, index) {
//                             var category = categories[index];
//                             return category['parent_id'] == null
//                                 ? CategoryCard(category: category)
//                                 : const SizedBox.shrink();
//                           },
//                         ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Paid Ad Section
//             // const PaidAd(bannerImage: 'assets/images/banner1.jpg'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:damasauction/controllers/home/home_controller.dart';
import 'package:damasauction/widgets/category/categorycard.dart';
import 'package:damasauction/widgets/home/customslider.dart';
import 'package:damasauction/widgets/shared/customdrawer.dart';
import 'package:damasauction/widgets/shared/searchbartop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Home Page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
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
    Get.put(HomeControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Text(
          'mazad dimashq'.tr,
          style: const TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            color: Colors.grey,
            onPressed: () {
              // Notification action can be added here
            },
          ),
        ],
      ),
      drawer: CustomDrawer(title: 'categories'.tr, categories: categories),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background.png"), // Add your image path
            fit: BoxFit.cover, // Adjust image size to cover the entire page
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Full-width search bar

              // Slider
              TPromeSlider(
                banners: const [
                  'assets/images/banner1.jpg',
                  'assets/images/banner2.jpg',
                  'assets/images/banner3.jpg',
                ],
                title: 'paid ad'.tr,
              ),
              const SizedBox(height: 20),
              SearchBarTop(
                hint: 'search all ads'.tr,
              ),

              const SizedBox(height: 20),

              // Categories Section
              Padding(
                padding: const EdgeInsets.all(
                    0.0), // Consistent padding for categories
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    categories.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              var category = categories[index];
                              return category['parent_id'] == null
                                  ? CategoryCard(category: category)
                                  : const SizedBox.shrink();
                            },
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Paid Ad Section
              // const PaidAd(bannerImage: 'assets/images/banner1.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
