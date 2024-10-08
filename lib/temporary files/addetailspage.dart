import 'package:damasauction/temporary%20files/advertpostedpage.dart';
import 'package:damasauction/temporary%20files/promote.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdDetailsPage extends StatefulWidget {
  const AdDetailsPage({super.key});

  @override
  AdDetailsPageState createState() => AdDetailsPageState();
}

class AdDetailsPageState extends State<AdDetailsPage> {
  //String? _selectedCategory; // To track the selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), // Curved edges for the whole page
          ),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button with Text
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left_outlined,
                              color: Colors.black),
                          onPressed: () {
                            // Handle back action
                            Get.back();
                          },
                        ),
                        const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Progress bar
                    LinearProgressIndicator(
                      minHeight: 10,
                      value: 1, // Step 3 (progress bar 3/3 filled)
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xffFD8F02)),
                    ),
                    const SizedBox(height: 10),
                    // Step Label
                    const Text(
                      "Step 3",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // H1: Add Photos and Video
                    const Text(
                      "Add photos and video",
                      style: TextStyle(
                        fontSize: 22, // H1 size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // H2: Upload up to 15 attachments (1 video allowed)
                    const Text(
                      "Upload up to 15 attachments (1 video allowed)",
                      style: TextStyle(
                        fontSize: 18, // H2 size
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // H3: Choose a default picture by a long tap
                    Text(
                      "Choose a default picture by a long tap",
                      style: TextStyle(
                        fontSize: 16, // H3 size
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Placeholder for video/photo upload
                    GestureDetector(
                      onTap: () {
                        // Open gallery or camera to upload
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Center(
                          child: Icon(Icons.add, size: 50, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Price label and text field
                    const Text(
                      "Price (SYP)",
                      style: TextStyle(fontSize: 16),
                    ),
                    const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter price',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description label and text field
                    const Text(
                      "Provide details in English",
                      style: TextStyle(fontSize: 16),
                    ),
                    // Name label and text field
                    const Text(
                      "Name",
                      style: TextStyle(fontSize: 16),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Enter description',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const SizedBox(height: 20),

                    // Ad Auto-Renewal slider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Ad Auto-Renewal",
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: true, // Adjust according to logic
                          onChanged: (bool value) {
                            setState(() {
                              // Handle toggle logic
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Additional Text: Auto-Renewal Information
                    Text(
                      "This ad will be auto-renewed after expiration for 30 days, "
                      "if you have a valid package, and this ad is set to auto-renew within it.",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),

                    // Advertisement summary with red border
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Mzad Dimashq never asks you to make payment outside the app. Scammers will send you links claiming that they will buy you online and requesting that you enter your credit card information. Never do it!",
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ActionButton(
                      iconData: Icons.person_add,
                      text: "Advertize",
                      backgroundColor: const Color(0xffFD8F02),
                      onPressed: () {
                        Get.to(const PromoteYourAdPage());
                      },
                    ),
                    // Advertise button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle advertise action
                          Get.to(const AdvertPostedPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xffFD8F02), // Button color
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Curved button
                          ),
                        ),
                        child: const Text(
                          "Advertise",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
