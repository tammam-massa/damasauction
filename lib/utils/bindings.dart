import 'package:damasauction/controllers/auth/auth_controller.dart';
import 'package:damasauction/core/class/crud.dart';
import 'package:damasauction/pages/landing/landing_controller.dart';
import 'package:damasauction/pages/login/login_controller.dart';
import 'package:damasauction/pages/signup/signup_controller.dart';
import 'package:damasauction/pages/verifycode_signup/verifycode_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.put(Crud());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());

    Get.lazyPut(() => VerifyCodeSignUpController());
    Get.lazyPut(() => LandingController());
  }
}
