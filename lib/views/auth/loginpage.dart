import 'package:damasauction/controllers/auth/auth_controller.dart';
import 'package:damasauction/core/class/handlingdataview.dart';
import 'package:damasauction/views/auth/signuppage.dart';
import 'package:damasauction/widgets/auth/customtextformauth.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// LoginPage class
class LoginPage extends StatelessWidget {
  final AuthController authController =
      Get.put(AuthController()); // Initialize AuthController

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3), // Background color
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white, // AppBar background color
        elevation: 0, // Remove shadow
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 80,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home, color: Color(0xff358cde)),
                    title: Text('home'.tr),
                    onTap: () {
                      // Handle home navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle,
                        color: Color(0xff358cde)),
                    title: Text('profile'.tr),
                    onTap: () {
                      // Handle profile navigation
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.settings, color: Color(0xff358cde)),
                    title: Text('settings'.tr),
                    onTap: () {
                      // Handle settings navigation
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Color(0xff358cde)),
                    title: Text('logout'.tr),
                    onTap: () {
                      // Handle logout action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: controller
                    .formstatelogin, // Use the form key for validation
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'welcome_back'.tr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'log_in_to_your_existing_account'.tr,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    // Email Field
                    CustomTextFormAuth(
                      hintText: 'enter_your_email_or_phone_number'.tr,
                      labelText: 'email_or_phone'.tr,
                      iconData: Icons.contact_mail,
                      myController: controller.emailController,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_your_email_or_phone_number'.tr;
                        }
                        if (GetUtils.isEmail(value)) {
                          return null; // Return null if valid email
                        }

                        // Validate phone number format
                        RegExp myRegex = RegExp(
                          r'^\+963(93|998|982|996|987|997|99|995|94|95|96|955)\d{7}$',
                        );

                        if (value.length != 13 || !myRegex.hasMatch(value)) {
                          return 'incorrect_phone_number'.tr;
                        }

                        return null;
                      },
                      isNumber: false,
                      readOnly: false,
                    ),

                    const SizedBox(height: 10),
                    // Password Field
                    CustomTextFormAuth(
                      hintText: 'enter_your_password'.tr,
                      labelText: 'password'.tr,
                      iconData: Icons.lock,
                      myController: controller.passwordController,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_your_password'.tr;
                        }

                        return null;
                      },
                      isNumber: false,
                      obscureText: controller.isshowPassword,
                      readOnly: false,
                      onTapIcon: () {
                        controller
                            .showPassword(); // Toggles password visibility
                      },
                    ),
                    const SizedBox(height: 10),
                    // Forgot Password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle "Forgot Password" action
                        },
                        child: Text(
                          'forgot_password'.tr,
                          style: const TextStyle(color: Color(0xff358cde)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Login Button
                    ActionButton(
                      onPressed: () async {
                        if (controller.formstatelogin.currentState!
                            .validate()) {
                          // Validate form
                          final username = controller.emailController;
                          final password = controller.passwordController;

                          // Call the AuthController login method with the hashed password
                          await authController.login(
                              username.text, password.text);
                        }
                      },
                      backgroundColor: const Color(0xff358cde),
                      iconData: Icons.login,
                      text: 'login'.tr,
                    ),
                    const SizedBox(height: 10),
                    Text('or'.tr),
                    const SizedBox(height: 10),
                    // Google Sign-In button with a custom background
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        // Handle Google login action
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      label: Text(
                        'sign_in_with_google'.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // "Don't have an account? Sign up" link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('dont_have_an_account'.tr),
                        TextButton(
                          onPressed: () {
                            // Handle sign-up action
                            Get.to(() => const SignUpPage());
                          },
                          child: Text(
                            'sign_up'.tr,
                            style: const TextStyle(color: Color(0xff358cde)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
