import 'package:damasauction/languages/localization_service.dart';
import 'package:damasauction/pages/landing/landing_controller.dart';
import 'package:damasauction/pages/landing/landing_page.dart';
import 'package:damasauction/pages/login/login_controller.dart';
import 'package:damasauction/pages/signup/signup_controller.dart';
import 'package:damasauction/pages/verifycode/verifycode_controller.dart';
import 'package:damasauction/routes/app_pages.dart';
import 'package:damasauction/services/services.dart';
import 'package:damasauction/utils/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize your services (Firebase, etc.) here if needed
  await Get.putAsync(() => MyServices().init());

  // Dependency Injection
  Get.lazyPut(() => RegisterController());
  Get.put(LandingController());
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => VerifyCodeSignUpController());

  // Load translations
  await LocalizationService.loadTranslations();

  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0, // Remove shadow
        ),
      ),
      home: LandingPage(), // Set the initial route to the landing page
      getPages: AppPages.pages, // Define your app pages here
    );
  }
}
