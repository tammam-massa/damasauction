import 'dart:convert';

import 'package:damasauction/controllers/profile/profile_controller.dart';
import 'package:damasauction/views/profile/editinfopage.dart';
import 'package:damasauction/widgets/profile/profile_button.dart';
import 'package:damasauction/widgets/shared/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatefulWidget {
  final String token; // Pass the token from login

  const ProfilePage({super.key, required this.token});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  List<dynamic> categories = [];
  final ProfileController profileController =
      Get.put(ProfileController()); // Initialize here

  @override
  void initState() {
    super.initState();
    fetchCategories();

    // Fetch profile data once when the widget is initialized
    profileController.fetchProfile(widget.token);
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
      drawer: CustomDrawer(title: 'categories'.tr, categories: categories),
      body: Obx(() {
        if (profileController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (profileController.profile.value == null) {
          return const Center(child: Text('Failed to load profile data.'));
        } else {
          final profile = profileController.profile.value!;

          String profileLink = profileController.getProfileLink();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile picture, name, and buttons row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFFF2F2F2),
                        child: Icon(Icons.person,
                            size: 50, color: Color(0xFFE7E7E7)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                ProfileButton(
                                  onPressed: () {
                                    Share.share(
                                        'Check out my profile: $profileLink');
                                  },
                                  icon: const Icon(Icons.share_outlined),
                                  label: "share".tr,
                                ),
                                const SizedBox(width: 10),
                                ProfileButton(
                                  onPressed: () {
                                    Get.to(() => const EditInfoPage());
                                  },
                                  icon: const Icon(Icons.edit_outlined),
                                  label: "edit".tr,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Profile additional data under the avatar and buttons
                  Text(
                    profile.email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${profile.phone ?? 'no_phone'.tr}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${profile.address ?? 'no_address'.tr}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // Add additional profile details here if needed
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
