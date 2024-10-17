import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignuupPage extends StatelessWidget {
  const SuccessSignuupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3), // Same background as SignUpPage
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFf3f3f3), // Match SignUpPage AppBar
        elevation: 0,
        title: Center(
          child: Text(
            "success".tr, // Page title
            style: const TextStyle(color: Color(0xff000000)),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Success Icon
              const Icon(
                Icons.check_circle_outline, // Success icon
                color: Color(0xffde358c), // Icon color as per your request
                size: 100, // Icon size
              ),
              const SizedBox(height: 20),

              // Success Message
              Text(
                "account_Created_successfully!".tr,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Subtext
              Text(
                "you_can_now_log_in_using_your_email_or_phone number.".tr,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Continue Button
              ActionButton(
                // iconData: Icons.login, // Icon for login
                text: "continue_to_login".tr, // Button text
                backgroundColor: const Color(0xffde358c), // Button color
                onPressed: () {
                  Get.offAllNamed("/login"); // Navigate to login page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
