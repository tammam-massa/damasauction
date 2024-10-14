import 'package:damasauction/pages/signup/signup_services.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var name = '';
  var password = '';
  var email = '';
  var mobilenom = '';
  var description = '';
  var confirmpassword = '';
  var loadingsignup = false.obs;

  var registerStatus = false;

  RegisterService service = RegisterService();

  Future<void> RegisterOnClick() async {
    loadingsignup(true); // Start loading
    print("Loading started...");

    // Print user input for debugging
    print("Name: $name");
    print("Email: $email");
    print("Mobile Number: $mobilenom");
    print("Description: $description");
    print("Password: $password");
    print("Confirm Password: $confirmpassword");

    registerStatus = await service.register(name, email, mobilenom, description,
        password, confirmpassword); // Call the registration service
    print("Registration status: $registerStatus");

    loadingsignup(false); // Stop loading
    print("Loading ended...");

    // Check if registration was successful
    if (registerStatus) {
      print("Registration successful, navigating to verification page...");
      Get.toNamed(AppRoutes.verificationSignUpCodePage, arguments: {
        "username": email.isNotEmpty
            ? email
            : mobilenom // Fallback to mobile number if email is empty
      });
    } else {
      // Handle registration failure
      print("Registration failed.");
      Get.defaultDialog(
        title: "Registration Failed",
        middleText: "Please check your details and try again.",
      );
    }
  }
}
