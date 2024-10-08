import 'package:damasauction/temporary%20files/choosecategorypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertLanguagePage extends StatefulWidget {
  const AdvertLanguagePage({super.key});

  @override
  AdvertLanguagePageState createState() => AdvertLanguagePageState();
}

class AdvertLanguagePageState extends State<AdvertLanguagePage> {
  String _selectedLanguage = ''; // To track the selected language

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
            color: Colors.white, // White background for the inner page
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button with Text
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                  const Text(
                    'Please choose the advert language:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Language Options (Selectable)
                  _buildLanguageOption(
                    context,
                    'Both',
                    'Your advert will appear for all people, you must write your advert text in English and Arabic languages.',
                  ),
                  const SizedBox(height: 20),
                  _buildLanguageOption(
                    context,
                    'English',
                    'Your advert will appear only for people who choose to see adverts in English, you must write your advert text with English language only.',
                  ),
                  const SizedBox(height: 20),
                  _buildLanguageOption(
                    context,
                    'Arabic',
                    'Your advert will appear only for people who choose to see adverts in Arabic, you must write your advert text with Arabic language only.',
                  ),
                  const Spacer(),
                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle next button
                        Get.to(const ChooseCategoryPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffFD8F02), // Button color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Curved button
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
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

  // Custom Container for Language Option with Curved White Box (Selectable)
  Widget _buildLanguageOption(
      BuildContext context, String language, String description) {
    bool isSelected = _selectedLanguage == language; // Check if selected

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language; // Update selected language
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFEAEAEA)
              : Colors.white, // Grey when selected
          borderRadius: BorderRadius.circular(15), // Curved edges for the box
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Shadow for box
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              language,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isSelected
                    ? const Color(0xffFD8F02)
                    : Colors.black, // Color for selected
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: isSelected
                    ? Colors.grey
                    : Colors.black, // Color for selected
                // color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
