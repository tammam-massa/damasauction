import 'package:damasauction/controllers/auth/auth_controller.dart';
import 'package:damasauction/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.put(Crud());
  }
}
