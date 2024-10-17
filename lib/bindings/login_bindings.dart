import 'package:damasauction/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
