// import 'package:damasauction/advertlanguagepage.dart';
// import 'package:damasauction/biddingpage.dart';
// import 'package:damasauction/choosecategorypage.dart';
// import 'package:damasauction/home.dart';
// import 'package:damasauction/more.dart';
// import 'package:damasauction/profilepage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   // List of pages to display
//   final List<Widget> _pages = [
//     const HomePage(),
//     BiddingPage(),
//     Container(), // Placeholder for the floating action button
//     const ProfilePage(),
//     MorePage(),
//   ];

//   // Navigation handler
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   scrolledUnderElevation: 0.0,
//       //   backgroundColor: Colors.white,
//       //   automaticallyImplyLeading: false,
//       // ),
//       body: Stack(
//         children: [
//           _pages[_selectedIndex], // Show the selected page
//           Positioned(
//             bottom:
//                 10.0, // Adjust this value to position the button above the bottom container
//             right: 16.0, // Distance from the right edge of the screen
//             child: Container(
//               width: 60, // Adjust width as needed
//               height: 80, // Adjust height as needed
//               decoration: BoxDecoration(
//                 color: const Color(0xffFD8F02), // Background color
//                 borderRadius: BorderRadius.circular(12.0), // Rounded corners
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 4.0,
//                     offset: const Offset(0, 2), // Shadow position
//                   ),
//                 ],
//               ),
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.help,
//                     color: Colors.white,
//                     size: 24.0, // Adjust size as needed
//                   ),
//                   SizedBox(height: 8), // Space between icon and text
//                   Text(
//                     'Help',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.0, // Adjust font size as needed
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white, // Set the BottomAppBar background to white
//         elevation: 0, // Remove shadow or elevation if any
//         child: Container(
//           height: 60.0, // Adjust the height as needed
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               Expanded(child: buildNavIcon(Icons.home, 'Home', 0)),
//               Expanded(child: buildNavIcon(Icons.gavel, 'Bidding', 1)),
//               const SizedBox(
//                 width: 40.0, // Space for the centered floating action button
//               ),
//               Expanded(child: buildNavIcon(Icons.person, 'My Ads', 3)),
//               Expanded(child: buildNavIcon(Icons.more_horiz, 'More', 4)),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xffFD8F02), // Orange color
//         shape: const CircleBorder(), // Ensure circular shape
//         child: const Icon(
//           Icons.add,
//           color: Colors.white, // White add icon
//           size: 36.0, // Adjusted size to make it prominent
//         ),
//         onPressed: () {
//           // Action for the center button (+)

//           Get.to(AdvertLanguagePage());
//         },
//       ),
//     );
//   }

//   // Helper method to build navigation icon
//   Widget buildNavIcon(IconData icon, String label, int index) {
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(
//             icon,
//             size: 22.0, // Adjust icon size
//             color: _selectedIndex == index
//                 ? const Color(0xffFD8F02)
//                 : const Color(0xffAFAFAF),
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12.0, // Adjust text size
//               color: _selectedIndex == index
//                   ? const Color(0xffFD8F02)
//                   : const Color(0xffAFAFAF),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
