import 'package:damasauction/core/class/crud.dart';
import 'package:damasauction/controllers/landing/landing_controller.dart';
import 'package:damasauction/controllers/auth/login_controller.dart';
import 'package:damasauction/controllers/auth/signup_controller.dart';
import 'package:damasauction/controllers/verifycode_signup/verifycode_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => VerifyCodeSignUpController());
    Get.lazyPut(() => LandingController());
  }
}
