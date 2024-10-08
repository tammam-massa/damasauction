// Home Controller
import 'package:damasauction/services/services.dart';
import 'package:get/get.dart';

class HomeControllerImp extends GetxController {
  var carouselCurrentIndex = 0.obs;
  MyServices myServices = Get.find();
  String? username;
  String? clientId;

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  // @override
  initalData() {
    username = myServices.sharedPreferences.getString("username");
    clientId = myServices.sharedPreferences.getString("client_id");
  }
}
