import 'package:damasauction/views/bidding/biddingcreditpage.dart';
import 'package:damasauction/views/bidding/refundrequestpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiddingPage extends StatelessWidget {
  const BiddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Set the page background color
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Text('Bidding'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Open the side menu (drawer)
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: const [Icon(Icons.notifications_none_outlined)],
      ),
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
      body: Column(
        children: [
          Container(
            color: const Color(
                0xFFF5F5F5), // Ensure the background color of the container
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white, // Set the card background color to white
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text('Your Current bidding limit is 0 SAR'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150, // Adjust width as needed
                            height: 40, // Adjust height as needed
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(const BiddingCreditPage());
                              },
                              icon: const Icon(
                                Icons.money_outlined,
                                color: Colors.white, // Set icon color to white
                              ),
                              label: const Text(
                                'Increase',
                                style: TextStyle(
                                    color: Colors.white), // Text color
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xffFD8F02), // Custom color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set curved edges
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 150, // Adjust width as needed
                            height: 40, // Adjust height as needed
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(const RefundRequestPage());
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white, // Set icon color to white
                              ),
                              label: const Text(
                                'Refund',
                                style: TextStyle(
                                    color: Colors.white), // Text color
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xffFD8F02), // Custom color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set curved edges
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOutlinedButton('My bids', Icons.gavel),
              const SizedBox(width: 5),
              _buildOutlinedButton('Watchlist', Icons.remove_red_eye),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildCategoryCard('Buses', 'assets/images/car2.jpg', 16),
                _buildCategoryCard('Car plates', 'assets/images/car.jpg', 11),
                _buildCategoryCard('Antiques', 'assets/images/car3.jpg', 11),
                _buildCategoryCard('Cars', 'assets/images/car2.jpg', 10),
                _buildCategoryCard('Buses', 'assets/images/car2.jpg', 16),
                _buildCategoryCard('Car plates', 'assets/images/car.jpg', 11),
                _buildCategoryCard('Antiques', 'assets/images/car3.jpg', 11),
                _buildCategoryCard('Cars', 'assets/images/car2.jpg', 10),
                // Add more categories as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutlinedButton(String text, IconData icon) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16.0), // Add space below the button
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.black, // Set icon color to black
        ),
        label: Text(
          text,
          style:
              const TextStyle(color: Colors.black), // Set text color to black
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white, // Set background color to white
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Curved edges
          ),
          side: const BorderSide(color: Colors.white), // Border color
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      String title, String imagePath, int notificationCount) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Apply rounded corners
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
                height: 160,
                width: 160,
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 12,
                child: Text(
                  notificationCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.left, // Optional styling for the title
          ),
        ),
      ],
    );
  }
}
