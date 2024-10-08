import 'package:damasauction/languages/localization_service.dart';
import 'package:damasauction/routes/app_pages.dart';
import 'package:damasauction/services/services.dart';

import 'package:damasauction/utils/bindings.dart';
import 'package:damasauction/views/splash/spalsh_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => MyServices().init());
  // Load translations
  await LocalizationService.loadTranslations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Replace with your actual token
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Damascus Auction',
      initialBinding: MyBinding(),
      translations: LocalizationService(), // Localization service
      locale: const Locale('ar', 'SA'), // Set initial locale to Arabic
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
        ),
      ),

      home: const SplashScreen(), // Set initial route to splash
      getPages: AppPages.pages,
    );
  }
}
