import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      locale: Get.deviceLocale, // Locale for device language
      fallbackLocale: const Locale('en', 'US'),
      // theme: lightTheme,              // Light theme
      // darkTheme: darkTheme,           // Dark theme
      // themeMode: ThemeService().getThemeMode(), // ThemeMode managed by ThemeService
      // initialRoute: AppRoutes.LOGIN,
      // getPages: AppPages.pages,
    );
  }
}
