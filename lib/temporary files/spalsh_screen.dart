// import 'package:damasauction/core/middleware/mymiddleware.dart';
// import 'package:damasauction/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SplashController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     // Navigate to the LoginPage after a delay
//     Future.delayed(const Duration(seconds: 2), () {
//       Get.offNamed('/login'); // Use GetX for navigation
//     });
//   }
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;
//   Future<void> _navigateToNextScreen() async {
//     await Future.delayed(const Duration(seconds: 4));
//     MyMiddleWare middleware = MyMiddleWare();
//     final nextRoute = middleware.redirect(null)?.name ?? AppRoutes.login;
//     Get.offNamed(nextRoute); // Navigate to the determined route
//   }

//   @override
//   void initState() {
//     _navigateToNextScreen();
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           // Navigate to the LoginPage when the animation completes
//           Future.delayed(const Duration(milliseconds: 100), () {

//           });
//         }
//       });

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeIn,
//       ),
//     );

//     _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeIn,
//       ),
//     );

//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Background color of the splash screen
//       body: Center(
//         child: FadeTransition(
//           opacity: _fadeAnimation,
//           child: ScaleTransition(
//             scale: _scaleAnimation,
//             child: Image.asset(
//               'assets/images/logo.jpeg', // Ensure this path is correct
//               width: 150, // Adjust size if needed
//               height: 150,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:damasauction/core/middleware/mymiddleware.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Middleware logic to determine the next route
    MyMiddleWare middleware = MyMiddleWare();
    final nextRoute = middleware.redirect(null)?.name ??
        AppRoutes.languageSelectionScreenStarter;

    // Navigate to the determined route after a delay
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(nextRoute); // Use GetX for navigation
    });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();

    // Initialize SplashController to handle navigation logic
    Get.put(SplashController());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              'assets/images/logo.jpeg', // Ensure this path is correct
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
