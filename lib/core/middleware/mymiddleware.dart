import 'package:damasauction/routes/app_routes.dart';
import 'package:damasauction/services/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // if (myServices.sharedPreferences.getString("step") == "2") {
    //   return const RouteSettings(name: AppRoutes.homeScreen);
    // }
    // if (myServices.sharedPreferences.getString("step") == "1") {
    //   return const RouteSettings(name: AppRoutes.login);
    // }
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
    // return const RouteSettings(name: AppRoutes.language);
  }
}
