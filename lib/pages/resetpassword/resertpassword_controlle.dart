import 'package:damasauction/pages/login/login_page.dart';
import 'package:damasauction/pages/resetpassword/resetpassword_service.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:damasauction/core/class/statusRequest.dart';
import 'package:damasauction/core/functions/handlingdata.dart';

class ResetPasswordController extends GetxController {
  var loadingResetPassword = false.obs; // Loading indicator
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordService service = ResetPasswordService();

  // Function to handle password reset
  Future<void> resetPassword(String username, String code, String newPassword,
      String confirmPassword) async {
    if (newPassword != confirmPassword) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Passwords do not match.",
      );
      return;
    }

    loadingResetPassword(true);
    statusRequest = StatusRequest.loading;
    update();

    var response = await service.resetPassword(
        username, code, newPassword, confirmPassword);
    statusRequest = handlingData(response);

    if (response != null && response['success'] == true) {
      Get.offNamed(
          AppRoutes.login); // Navigate to login page upon successful reset
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Password reset failed. Please try again.",
      );
    }

    loadingResetPassword(false);
    update();
  }
}
