import 'package:damasauction/temporary%20files/editinfopage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool _isExpanded = false; // Track the expansion state
  bool _isRepostIntervalExpanded =
      false; // Track repost interval expansion state
  String _activeTab = 'Active'; // Track the currently active tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Open the side menu (drawer)
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Container(
          padding: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search your ads',
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              contentPadding: const EdgeInsets.all(12.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture and name row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFF2F2F2),
                    child:
                        Icon(Icons.person, size: 50, color: Color(0xFFE7E7E7)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'No Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text('No Description',
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 4),
                        const Text('+963000000000',
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.to(() => const EditInfoPage());
                              },
                              icon: const Icon(Icons.share_outlined),
                              label: const Text('Share'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFC3C3C3),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: const BorderSide(
                                    color: Color(0xFFF2F2F2),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.to(() => const EditInfoPage());
                              },
                              icon: const Icon(Icons.edit_outlined),
                              label: const Text('Edit'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFC3C3C3),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: const BorderSide(
                                    color: Color(0xFFF2F2F2),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Profile statistics under the avatar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Followers', '0'),
                  const SizedBox(height: 10),
                  _buildDetailRow('Following', '0'),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Published ads',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  if (_isExpanded) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFF2F2F2), // Background color for subcategories
                        borderRadius:
                            BorderRadius.circular(8.0), // Curved edges
                      ),
                      padding: const EdgeInsets.all(
                          16.0), // Padding around the content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow('Purchased ads limit', '0/0'),
                          const SizedBox(height: 10),
                          _buildDetailRow('Free package limit', '0/470'),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isRepostIntervalExpanded = !_isRepostIntervalExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Repost interval',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
                          _isRepostIntervalExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  if (_isRepostIntervalExpanded) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFFF2F2F2), // Background color for subcategories
                        borderRadius:
                            BorderRadius.circular(8.0), // Curved edges
                      ),
                      padding: const EdgeInsets.all(
                          16.0), // Padding around the content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow('Name ', 'Default'),
                          const SizedBox(height: 10),
                          _buildDetailRow('Expiration', '-'),
                          const SizedBox(
                              height: 10), // Adjust spacing before button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle upgrade action here
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(
                                      50, 40), // Adjust size if needed
                                  backgroundColor: const Color(0xffFD8F02),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                child: const Text('Upgrade'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 30),
                  backgroundColor: const Color(0xffFD8F02),
                ),
                child: const Text('Account Overview'),
              ),
              const SizedBox(height: 20),
              Container(
                width: 400,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff27345e),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    "Promote Now",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Tabs for Active, Favorites, Commented, Liked
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabButton('Active', 'Active'),
                  _buildTabButton('Favorites', 'Favorites'),
                  _buildTabButton('Commented', 'Commented'),
                  _buildTabButton('Liked', 'Liked'),
                ],
              ),

              const SizedBox(height: 20),
              if (_activeTab == 'Active') _buildActiveTabContent(),
              if (_activeTab == 'Favorites') _buildFavoritesTabContent(),
              if (_activeTab == 'Commented') _buildCommentedTabContent(),
              if (_activeTab == 'Liked') _buildLikedTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14, // You can adjust the font size if needed
            color: Colors.black, // Adjust text color if needed
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String tabName, String label) {
    return TextButton(
      onPressed: () {
        setState(() {
          _activeTab = tabName;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor: _activeTab == tabName
            ? const Color(0xffFD8F02)
            : Colors.white, // Active background color
      ),
      child: Text(
        label,
        style: TextStyle(
          color: _activeTab == tabName ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActiveTabContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.ad_units, // Icon for "Advertise"
            size: 60,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          const Text(
            'You do not have any posted adverts yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle the button press
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
              foregroundColor: const Color(0xffFD8F02), // Text color (Orange)
              backgroundColor: Colors.white, // Button background color (White)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color(0xffFD8F02), // Border color (Orange)
                  width: 2.0, // Border width
                ),
              ),
            ),
            child: const Text('Create your first ad'),
          )
        ],
      ),
    );
  }

  Widget _buildFavoritesTabContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_outline, // Icon for "Advertise"
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'You do not have any  favorite ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCommentedTabContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.comment, // Icon for "Advertise"
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'You do not have any commented ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLikedTabContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.link_outlined, // Icon for "Advertise"
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'You do not have any liked adverts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
