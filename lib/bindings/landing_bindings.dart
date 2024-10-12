import 'package:damasauction/pages/landing/landing_controller.dart';
import 'package:get/get.dart';

class LandingPageBinging extends Bindings {
  @override
  void dependencies() {
    Get.put<LandingController>(LandingController());
  }
}
