import 'package:damasauction/pages/signup/signup_controller.dart';
import 'package:get/get.dart';

class RegisterPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}
