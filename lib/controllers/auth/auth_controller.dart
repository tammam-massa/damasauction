import 'package:damasauction/core/class/statusRequest.dart';
import 'package:damasauction/models/auth/user_model.dart';
import 'package:damasauction/services/api_service.dart';
import 'package:damasauction/services/services.dart';
import 'package:damasauction/views/auth/successpage.dart';
import 'package:damasauction/pages/verifycode/verifycode_signup.dart';
import 'package:damasauction/views/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  // Initialize the controllers directly without using 'late'
  late TextEditingController emailController;
  late TextEditingController passwordController;
  // Observable user object with default values
  var user = UserModel(
    name: '',
    username: '',
    email: '',
    phone: '',
    password: '',
    passwordConfirmation: '',
    clientId: 0,
  ).obs;

  var token = ''.obs; // JWT token
  final ApiService apiService = ApiService(); // Initialize the ApiService
  bool isshowPassword = true;
  bool isshowConfirmPassword = true;

  showPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  showConfirmPassword() {
    isshowConfirmPassword = isshowConfirmPassword == true ? false : true;
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;

  // Register user method
  Future<void> register(
    String name,
    String username,
    String? email,
    String? phone,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      // Set status to loading and update the UI
      statusRequest = StatusRequest.loading;
      update();

      Map<String, dynamic> requestData = {
        'name': name,
        'username': username,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };

      // Include email or phone based on what's provided
      if (email != null) {
        requestData['email'] = email;
      } else if (phone != null) {
        requestData['phone'] = phone;
      }

      // Register user using API service
      await apiService.registerUser(requestData);

      // After successful registration, set status to success
      statusRequest = StatusRequest.success;
      update();

      Get.snackbar(
        'success'.tr,
        'user_registered_successfully'.tr,
        backgroundColor: const Color(0xFF000000), // Background color
        colorText: const Color(0xFFffffff), // Text color
        icon: const Icon(
          Icons.check_circle_outline, // Add an icon
          color: Color(0xFFffffff), // Icon color
        ),
        snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
        borderRadius: 12, // Rounded corners
        margin: const EdgeInsets.all(16), // Padding around the snackbar
        duration: const Duration(seconds: 3), // Duration to show the snackbar
      );

      Get.to(() => VerificationSignUpCodePage());
    } catch (e) {
      // Set status to failure on error and update the UI
      statusRequest = StatusRequest.failure;
      print(e);
      update();
      Get.snackbar(
        'error'.tr,
        'failed_to_register_user.Please_try_again.'.tr,
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
    }
  }

  Future<bool> login(String username, String password) async {
    // Set status to loading
    statusRequest = StatusRequest.loading;
    update();

    try {
      // API call to login
      final response = await apiService.loginUser(username, password);

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

  // Fetch authenticated user data
  // Future<void> fetchUserData() async {
  //   try {
  //     if (token.isNotEmpty) {
  //       final userData = await apiService.getUserData(token.value);
  //       user.value = UserModel.fromJson(userData);
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Failed to fetch user data.',
  //       backgroundColor: const Color(0xFF000000), // Background color
  //       colorText: const Color(0xFFffffff), // Text color
  //       icon: const Icon(
  //         Icons.error_outline, // Add an icon
  //         color: Color(0xFFffffff), // Icon color
  //       ),
  //       snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
  //       borderRadius: 12, // Rounded corners
  //       margin: const EdgeInsets.all(16), // Padding around the snackbar
  //       duration: const Duration(seconds: 3), // Duration to show the snackbar
  //     );
  //   }
  // }

//start from here

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
