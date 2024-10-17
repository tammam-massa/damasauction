import 'package:damasauction/core/class/statusRequest.dart';
import 'package:damasauction/core/functions/handlingdata.dart';
import 'package:damasauction/pages/verifycode_signup/verifycode_service.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpController extends GetxController {
  var loadingVerifyCode = false.obs; // Renamed for clarity

  String? username; // To hold username (email or phone)
  StatusRequest statusRequest = StatusRequest.none;

  VerifyCodeService service = VerifyCodeService();

  @override
  void onInit() {
    super.onInit(); // Always call super first

    final args = Get.arguments;

    if (args != null && args.containsKey('username')) {
      username = args['username'] as String?;
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Username is missing", // Alert user
      );
      return; // Prevent further processing
    }
  }

  goToSuccessSignUp(String? verificationCode) async {
    if (verificationCode == null || verificationCode.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Verification code cannot be empty",
      );
      return; // Exit if verification code is null or empty
    }

    // Check if username is null before proceeding
    if (username == null) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Username cannot be null",
      );
      return; // Exit if username is null
    }

    loadingVerifyCode(true);
    statusRequest = StatusRequest.loading;
    update();

    var response = await service.verifyCode(username!, verificationCode);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignupPage);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "The Verification Code Is Not Correct.",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void reSend() {
    // Check if username is null before proceeding
    if (username == null) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Username cannot be null",
      );
      return; // Exit if username is null
    }

    service.resendData(username!);
  }
}
