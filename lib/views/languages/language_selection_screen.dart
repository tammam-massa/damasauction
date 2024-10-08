import 'package:damasauction/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionScreenStarter extends StatelessWidget {
  const LanguageSelectionScreenStarter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF358CDE),
                  Color(0xFF4DA8F0)
                ], // Background gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Language selection content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Language Title
                Text(
                  'Select Your Language',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Arabic Language Button with Gradient Background
                Container(
                  width: double.infinity, // Make the button take full width
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF358CDE),
                        Color(0xFF4DA8F0)
                      ], // Gradient colors for the button
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Transparent because of gradient
                      shadowColor:
                          Colors.transparent, // No shadow needed for gradient
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    onPressed: () {
                      Get.updateLocale(const Locale('ar')); // Set to Arabic
                      Get.toNamed(AppRoutes.login); // Navigate to login page
                    },
                    child: const Text(
                      'العربية',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Text color stays white
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // English Language Button with Gradient Background
                Container(
                  width: double.infinity, // Full width for button
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF358CDE),
                        Color(0xFF4DA8F0)
                      ], // Gradient colors for the button
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Transparent for gradient
                      shadowColor: Colors.transparent, // No shadow
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    onPressed: () {
                      Get.updateLocale(const Locale('en')); // Set to English
                      Get.toNamed(AppRoutes.login); // Navigate to login page
                    },
                    child: const Text(
                      'English',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Text color remains white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
