import 'package:damasauction/services/services.dart';
import 'package:damasauction/views/ads/chooese_ads_category_step1.dart';
import 'package:damasauction/views/bidding/biddingpage.dart';
import 'package:damasauction/views/home/home.dart';
import 'package:damasauction/views/more/more.dart';
import 'package:damasauction/views/profile/profilepage.dart';
import 'package:damasauction/widgets/home/nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  MyServices myServices = Get.find();
  int _selectedIndex = 0;
  String? token;

  @override
  void initState() {
    super.initState();
    // Retrieve token from shared preferences
    token = myServices.sharedPreferences.getString("access_token");
  }

  // List of pages to display
  final List<Widget> _pages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize _pages after token is retrieved
    _pages.addAll([
      const HomePage(),
      const BiddingPage(),
      Container(), // Placeholder for the floating action button
      ProfilePage(token: token ?? ''), // Pass the token to ProfilePage
      MorePage(),
    ]);
  }

  // Navigation handler
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex], // Show the selected page
          Positioned(
            bottom:
                10.0, // Adjust this value to position the button above the bottom container
            right: 16.0, // Distance from the right edge of the screen
            child: Container(
              width: 60, // Adjust width as needed
              height: 80, // Adjust height as needed
              decoration: BoxDecoration(
                color: const Color(0xff358cde), // Background color
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4.0,
                    offset: const Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.help,
                    color: Colors.white,
                    size: 24.0, // Adjust size as needed
                  ),
                  const SizedBox(height: 8), // Space between icon and text
                  Text(
                    'help'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white, // Set the BottomAppBar background to white
        elevation: 0, // Remove shadow or elevation if any
        child: SizedBox(
          height: 40.0, // Adjust the height as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: NavIcon(
                  icon: Icons.home,
                  label: 'home'.tr,
                  index: 0,
                  selectedIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ),
              Expanded(
                child: NavIcon(
                  icon: Icons.gavel,
                  label: 'bidding'.tr,
                  index: 1,
                  selectedIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ),
              const SizedBox(
                width: 40.0, // Space for the centered floating action button
              ),
              Expanded(
                child: NavIcon(
                  icon: Icons.person,
                  label: 'my ads'.tr,
                  index: 3,
                  selectedIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ),
              Expanded(
                child: NavIcon(
                  icon: Icons.more_horiz,
                  label: 'more'.tr,
                  index: 4,
                  selectedIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff358cde), // Background color
        shape: const CircleBorder(), // Ensure circular shape
        child: const Icon(
          Icons.add,
          color: Colors.white, // White add icon
          size: 36.0, // Adjusted size to make it prominent
        ),
        onPressed: () {
          // Action for the center button (+)
          Get.to(const ChooseAdsCategoryPage());
        },
      ),
    );
  }
}
