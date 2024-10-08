import 'package:damasauction/views/languages/language_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'language'.tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left_outlined,
                color: Colors.black), // Back button icon
            onPressed: () {
              Get.back(); // Handle back action
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none,
                  color: Colors.grey), // Notification icon
              onPressed: () {
                // Handle notification action
              },
            ),
          ],
        ),
        body: const LanguageSelectionForm(),
      ),
    );
  }
}
