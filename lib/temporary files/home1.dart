import 'package:damasauction/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //   HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: const Text(
          'Mazad Dimashq',
          style: TextStyle(color: Colors.grey),
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
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 16), // Reduced padding
              child: const Text(
                '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20, // Reduced font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      color: Color(0xffFD8F02),
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      // Handle home navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.account_circle,
                      color: Color(0xffFD8F02),
                    ),
                    title: const Text('Profile'),
                    onTap: () {
                      // Handle profile navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      color: Color(0xffFD8F02),
                    ),
                    title: const Text('Settings'),
                    onTap: () {
                      // Handle settings navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Color(0xffFD8F02),
                    ),
                    title: const Text('Logout'),
                    onTap: () {
                      // Handle logout action
                    },
                  ),
                  const Divider(), // Divider line
                  ListTile(
                    leading: const Icon(
                      Icons.local_offer,
                      color: Color(0xffFD8F02),
                    ),
                    title: const Text('Live Auction'),
                    onTap: () {
                      // Handle Live Auction navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.category,
                      color: Color(0xffFD8F02),
                    ),
                    title: const Text('Ads Categories'),
                    onTap: () {
                      // Handle Ads Categories navigation
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Full-width search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search all ads',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Slider
            const TPromeSlider(
              banners: [
                'assets/images/banner1.jpg',
                'assets/images/banner2.jpg',
                'assets/images/banner3.jpg',
              ],
            ),
            const SizedBox(height: 20),
            // Live Auction Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Live Auction',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildAuctionCard(),
                        const SizedBox(width: 10),
                        buildAuctionCard(),
                        const SizedBox(width: 10),
                        buildAuctionCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Real estate cards (new section)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Real Estate',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '22222333 Ads',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildRealEstateCard(
                            'Property',
                            'assets/images/property.png',
                            const Color(0xffFDE1CC)),
                        const SizedBox(width: 10),
                        buildRealEstateCard('Lands', 'assets/images/lands.png',
                            const Color(0xFFD9F0B8)),
                        const SizedBox(width: 10),
                        buildRealEstateCard('Furniture',
                            'assets/images/furniture.png', Colors.pink[100]!)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(padding: EdgeInsets.all(8.0)),
            // Additional Content Here
            const Center(
              child: Text(
                '',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Auction Card Widget
  Widget buildAuctionCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/car.jpg', // Replace with actual image
              width: 164, // Adjust width to fill container
              height: 164,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 164, // Adjust width to fill container
            padding: const EdgeInsets.all(12.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Land Cruiser GX-R 4.0L', // Example text
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '12:34 PM', // Example time
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.gavel, color: Colors.grey, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '0', // Example auction number
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.attach_money, color: Colors.grey, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '5000.000 SYP', // Example price
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Real Estate Card Widget

  Widget buildRealEstateCard(String title, String imagePath, Color bgColor) {
    return Container(
      width: 120,
      height: 180,
      decoration: BoxDecoration(
        color: bgColor, // Set transparency for the background
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Positioned image at the bottom-left corner
          Positioned(
            bottom: 10,
            right: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  10), // Optional: Add slight rounding to the image
              child: Image.asset(
                imagePath,
                width: 80, // Adjust the width as needed
                height: 100, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned title at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Slider Widget (TPromeSlider)
class TPromeSlider extends StatelessWidget {
  final List<String> banners;
  const TPromeSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller =
        Get.find<HomeControllerImp>(); // Use Get.find() instead of Get.put()
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Paid Ad',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              aspectRatio: 16 / 9,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                controller.updatePageIndicator(index);
              },
            ),
            items: banners.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      banner,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: TcircularContainer(
                    width: 12,
                    height: 12,
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? const Color(0xffFD8F02)
                        : const Color(0x80FD8F02),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// Circular Indicator Container
class TcircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;

  const TcircularContainer({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
