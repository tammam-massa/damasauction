import 'package:damasauction/core/class/statusRequest.dart';
import 'package:damasauction/pages/login/login_services.dart';
import 'package:damasauction/services/services.dart';
import 'package:damasauction/views/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  // Initialize the controllers directly without using 'late'
  late TextEditingController emailController;
  late TextEditingController passwordController;
  StatusRequest statusRequest = StatusRequest.none;
  LoginService service = LoginService();
  var token = ''.obs; // JWT token
  var loadinglogin = false.obs;

  Future<bool> loginOnClick(String username, String password) async {
    loadinglogin(true);
    // Set status to loading
    statusRequest = StatusRequest.loading;
    update();

    try {
      // API call to login
      final response = await service.loginUser(username, password);

      if (response != null && response['success'] == true) {
        final jwtToken = response['data']?['access_token'];

        if (jwtToken != null) {
          // Safely store data in SharedPreferences
          token.value = jwtToken;

          await myServices.sharedPreferences
              .setString("name", response['data']['name'] ?? '');
          await myServices.sharedPreferences
              .setString("username", response['data']['username'] ?? '');
          await myServices.sharedPreferences
              .setString("email", response['data']['email'] ?? '');
          await myServices.sharedPreferences
              .setString("phone", response['data']['phone'] ?? '');
          await myServices.sharedPreferences
              .setString("access_token", jwtToken); // Store access token
          // Ensure client_id is an int and not null
          final clientId = response['data']['client_id'];
          if (clientId != null && clientId is int) {
            await myServices.sharedPreferences.setInt("clientId", clientId);
          }

          await myServices.sharedPreferences.setString("step", "2");
          Get.snackbar(
            'success'.tr,
            'user_login_successfully'.tr,
            backgroundColor: const Color(0xFF000000), // Background color
            colorText: const Color(0xFFffffff), // Text color
            icon: const Icon(
              Icons.check_circle_outline, // Add an icon
              color: Color(0xFFffffff), // Icon color
            ),
            snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
            borderRadius: 12, // Rounded corners
            margin: const EdgeInsets.all(16), // Padding around the snackbar
            duration:
                const Duration(seconds: 3), // Duration to show the snackbar
          );
          // Navigate to the HomeScreen after saving preferences
          Get.offAll(() => const HomeScreen());

          // Set status to success
          statusRequest = StatusRequest.success;
          update();
          return true;
        } else {
          // Token missing case
          Get.snackbar(
            'error'.tr,
            'login_failed: token_is_missing'.tr,
            backgroundColor: const Color(0xFF000000), // Background color
            colorText: const Color(0xFFffffff), // Text color
            icon: const Icon(
              Icons.error_outline, // Add an icon
              color: Color(0xFFffffff), // Icon color
            ),
            snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
            borderRadius: 12, // Rounded corners
            margin: const EdgeInsets.all(16), // Padding around the snackbar
            duration:
                const Duration(seconds: 3), // Duration to show the snackbar
          );

          statusRequest = StatusRequest.failure;
          update();
          return false;
        }
      } else {
        // Handle invalid credentials
        Get.snackbar(
          'error'.tr,
          'login_failed: invalid_credentials'.tr,
          backgroundColor: const Color(0xFF000000), // Background color
          colorText: const Color(0xFFffffff), // Text color
          icon: const Icon(
            Icons.error_outline, // Add an icon
            color: Color(0xFFffffff), // Icon color
          ),
          snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
          borderRadius: 12, // Rounded corners
          margin: const EdgeInsets.all(16), // Padding around the snackbar
          duration: const Duration(seconds: 3), // Duration to show the snackbar
        );

        statusRequest = StatusRequest.failure;
        update();
        return false;
      }
    } catch (e) {
      // Handle exception
      //  Get.snackbar('error'.tr, '${'login_failed:'.tr}${e.toString()}');
      Get.snackbar(
        'error'.tr, // Translated title
        '${'login_failed:'.tr} ${e.toString()}', // Translated message with error details
        backgroundColor: const Color(0xFF000000), // Background color
        colorText: const Color(0xFFFFFFFF), // Text color
        icon: const Icon(
          Icons.error_outline, // Icon
          color: Color(0xFFFFFFFF), // Icon color
        ),
        snackPosition: SnackPosition.BOTTOM, // Snackbar position
        borderRadius: 12, // Rounded corners
        margin: const EdgeInsets.all(16), // Margin around snackbar
        duration: const Duration(seconds: 3), // Duration to show snackbar
      );

      statusRequest = StatusRequest.failure;
      update();
      return false;
    }
  }
}
