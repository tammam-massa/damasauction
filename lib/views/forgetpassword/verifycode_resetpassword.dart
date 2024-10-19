import 'package:damasauction/controllers/forgetpassword/verifycodereserpassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationResetPasswordCodePage extends StatelessWidget {
  final VerifyCodeForgetPasswordController controller = Get.find();

  VerificationResetPasswordCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80), // For spacing at the top

              // Verification Title
              const Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10), // Space between title and subtitle

              // Subtitle
              const Text(
                'We have sent a 6-digit code to your email. Please enter it to verify.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40), // Space before the OTP fields

              // OTP Text Field
              Obx(() {
                if (controller.otpClearTrigger.value) {
                  // Clear the field by rebuilding the widget when otpClearTrigger is true
                  return OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      // Handle validation or checks if needed
                    },
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessResetPassword(verificationCode);
                    },
                  );
                } else {
                  return OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      // Handle validation or checks if needed
                    },
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessResetPassword(verificationCode);
                    },
                  );
                }
              }),

              const SizedBox(height: 40), // Space before the button

              const SizedBox(
                  height: 20), // Space between button and resend text

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
