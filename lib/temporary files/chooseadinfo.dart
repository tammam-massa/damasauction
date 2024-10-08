import 'package:damasauction/temporary%20files/addetailspage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAdInfoPage extends StatelessWidget {
  const ChooseAdInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5), // Light grey background for the Scaffold
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30), // Curved edges at the top
          ),
          child: Container(
            color: Colors.white, // Set the background of the page to white
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                      GestureDetector(
                        onTap: () {
                          Get.back(); // Handle back tap for text as well
                        },
                        child: Text(
                          'back'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Step Progress Indicator
                  LinearProgressIndicator(
                    minHeight: 10,
                    value: 0.66, // Change this value for progress (0.0 to 1.0)
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xff358cde), // Custom progress color
                  ),
                  const SizedBox(height: 16),

                  // Step Label
                  Text(
                    "step 2".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Ad Type
                  const Text("select_category",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                  const SizedBox(height: 10),
                  buildSelectionTile(context, "Choose ad type"),
                  const SizedBox(height: 16),

                  // City
                  const Text("City",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                  const SizedBox(height: 10),
                  buildSelectionTile(context, "Choose City"),
                  const SizedBox(height: 16),

                  // Motors
                  const Text("Motors",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                  const SizedBox(height: 10),
                  buildSelectionTile(context, "Choose Motor"),
                  const SizedBox(height: 16),

                  // Class
                  const Text("Class",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                  const SizedBox(height: 10),
                  buildSelectionTile(context, "Choose Class"),
                  const SizedBox(height: 16),

                  // Model
                  const Text("Model",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)),
                  const SizedBox(height: 10),
                  buildSelectionTile(context, "Choose Model"),
                  const Spacer(),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffFD8F02), // Button color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Next button functionality
                        Get.to(const AdDetailsPage());
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectionTile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Navigate to the selection screen
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
