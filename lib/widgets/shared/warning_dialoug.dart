import 'package:damasauction/controllers/more/more_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarningDialog extends StatelessWidget {
  final MoreControllerImp moreController = Get.put(MoreControllerImp());

  WarningDialog({super.key});

  // Method to show the warning dialog with dynamic title and message
  void showWarningDialog(BuildContext context, String title, String message) {
    Get.defaultDialog(
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      buttonColor: const Color(0xffde358c), // Color for Confirm button
      title: title.tr, // Use translated title
      middleText: message.tr, // Use translated message
      barrierDismissible:
          false, // Prevent closing the dialog by tapping outside
      actions: [
        const SizedBox(height: 2), // Add some space between buttons
        // Default Confirm Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffde358c), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded edges
            ),
          ),
          onPressed: () {
            moreController.logout(); // Perform logout action
            Get.back(); // Close the dialog
          },
          child: Text(
            'confirm'.tr, // Translated Confirm text
            style: const TextStyle(color: Colors.white), // Confirm text color
          ),
        ),
        const SizedBox(height: 8), // Add some space between buttons
        // Default Cancel Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Background color
            side: const BorderSide(color: Color(0xffde358c)), // Border color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded edges
            ),
          ),
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: Text(
            'cancel'.tr, // Translated Cancel text
            style:
                const TextStyle(color: Color(0xffde358c)), // Cancel text color
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // The widget is empty because it will only trigger the dialog
  }
}
