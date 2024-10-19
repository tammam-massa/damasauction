import 'package:damasauction/services/signup_services.dart';
import 'package:damasauction/routes/app_routes.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var name = '';
  var password = '';
  var username = '';
  var mobilenom = '';
  var whatsapp = '';
  var confirmpassword = '';
  var loadingsignup = false.obs;

  var registerStatus = false;

  RegisterService service = RegisterService();

  Future<void> RegisterOnClick() async {
    loadingsignup(true); // Start loading
    print("Loading started...");

    // Print user input for debugging
    print("Name: $name");
    print("username: $username");
    print("whatsapp: $whatsapp");
    print("Password: $password");
    print("Confirm Password: $confirmpassword");

    registerStatus = await service.register(name, username, whatsapp, password,
        confirmpassword); // Call the registration service
    print("Registration status: $registerStatus");

    loadingsignup(false); // Stop loading
    print("Loading ended...");

    // Check if registration was successful
    if (registerStatus) {
      print("Registration successful, navigating to verification page...");
      Get.toNamed(AppRoutes.verificationSignUpCodePage,
          arguments: {"username": username});
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
