import 'package:damasauction/core/middleware/mymiddleware.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Middleware logic to determine the next route
    MyMiddleWare middleware = MyMiddleWare();
    final nextRoute = middleware.redirect(null)?.name ?? AppRoutes.homeScreen;

    // Navigate to the determined route after a delay
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(nextRoute); // Use GetX for navigation
    });
  }
}
