// More Controller
import 'package:damasauction/routes/app_routes.dart';
import 'package:damasauction/services/services.dart';
import 'package:get/get.dart';

class MoreControllerImp extends GetxController {
  MyServices myServices = Get.find();

  void logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
