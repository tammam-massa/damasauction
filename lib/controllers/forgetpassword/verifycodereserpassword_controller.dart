import 'package:damasauction/core/class/statusRequest.dart';
import 'package:damasauction/core/functions/handlingdata.dart';
import 'package:damasauction/services/forgetpassword_service.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:get/get.dart';

class VerifyCodeForgetPasswordController extends GetxController {
  var loadingVerifyCode = false.obs; // Tracks loading state
  String? username; // Holds username (email or phone)
  StatusRequest statusRequest = StatusRequest.none;
  var otpClearTrigger = false.obs; // Observable to trigger OTP clearing
  ForgotPasswordService service =
      ForgotPasswordService(); // Service for password-related requests

  @override
  void onInit() {
    super.onInit(); // Always call super first

    final args = Get.arguments;

    // Retrieve the username from arguments
    if (args != null && args.containsKey('username')) {
      username = args['username'] as String?;
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText:
            "Username is missing", // Alert the user if username is not passed
      );
      return; // Prevent further execution if username is missing
    }
  }

  // Function to handle verification of the code
  Future<void> goToSuccessResetPassword(String? verificationCode) async {
    if (verificationCode == null || verificationCode.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText:
            "Verification code cannot be empty", // Alert user if code is missing
      );
      return;
    }

    if (username == null) {
      Get.defaultDialog(
        title: "Error",
        middleText:
            "Username cannot be null", // Alert user if username is missing
      );
      return;
    }

    loadingVerifyCode(true); // Start loading indicator
    statusRequest = StatusRequest.loading;
    update(); // Update the UI

    // Send the verification request
    Map<String, dynamic>? response =
        await service.verifyCode(username!, verificationCode);
    statusRequest = handlingData(response);

    // Check if response is not null before accessing its content
    if (response != null && statusRequest == StatusRequest.success) {
      if (response['success'] == true) {
        // Navigate to ResetPasswordPage after successful code verification
        Get.toNamed(AppRoutes.resetPasswordPage, arguments: {
          'username': username,
          'code': verificationCode,
        });
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText:
              "The Verification Code is incorrect or expired.", // Handle incorrect code
        );
        otpClearTrigger.value = true; // Clear the OTP field on incorrect code
        statusRequest = StatusRequest.failure;
      }
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText:
            "An error occurred while verifying the code.", // Handle general errors
      );
    }

    loadingVerifyCode(false); // Stop loading indicator
    update(); // Ensure UI is updated
  }
}
