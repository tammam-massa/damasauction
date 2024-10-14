import 'package:damasauction/pages/landing/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  LandingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image 1
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height:
                  MediaQuery.of(context).size.height, // Adjust height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background.png'), // Placeholder for the pink background
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Background Image 2
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.65, // Adjust height as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/d11.png'), // Placeholder for the pink background
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Logo
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.52, // Adjust positioning as needed
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset('assets/images/logo.png',
                    height: 120), // Placeholder for the logo
                SizedBox(height: 40), // Space between logo and buttons
              ],
            ),
          ),

          // Login Button
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.03,
            left: 20,
            right: 20,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add login functionality
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20), // Space between buttons

                // Create an Account Button
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    side: BorderSide(color: Colors.blue, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Create an Account",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
