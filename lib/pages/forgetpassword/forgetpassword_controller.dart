import 'package:damasauction/pages/forgetpassword/forgetpassword_service.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For GetX navigation and state management

class ForgotPasswordController extends GetxController {
  // Extend GetxController for lifecycle methods
  final ForgotPasswordService service = ForgotPasswordService();
  late TextEditingController username;

  // Function to trigger the forgot password request
  Future<void> forgotPassword() async {
    if (username.text.isNotEmpty) {
      final result = await service.forgotPassword(username.text);

      if (result != null && result['success'] == true) {
        // Navigate to the verification page with the username as an argument
        Get.offNamed(
          AppRoutes.verificationResetPasswordCodePage,
          arguments: {"username": username.text},
        );
      } else {
        print('Error: ${result != null ? result['errors'] : 'Unknown error'}');
      }
    } else {
      print('Username is empty');
    }
  }

  @override
  void onInit() {
    username = TextEditingController(); // Initialize the TextEditingController
    super.onInit(); // Call the super method
  }

  @override
  void dispose() {
    username.dispose(); // Dispose of the TextEditingController
    super.dispose(); // Call the super method
  }
}
