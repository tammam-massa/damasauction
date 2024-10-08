import 'package:damasauction/controllers/auth/auth_controller.dart';
import 'package:damasauction/views/auth/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  String selectedCountryCode = '+963'; // Default country code
  final AuthController authController =
      Get.put(AuthController()); // Initialize AuthController

  // Controllers for form fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Login with Email and Login with Phone
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5), // Background color
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
          bottom: const TabBar(
            labelColor: Color(0xffFD8F02),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xffFD8F02),
            tabs: [
              Tab(text: "Email"),
              Tab(text: "Phone"),
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
                      leading: const Icon(Icons.home, color: Color(0xffFD8F02)),
                      title: const Text('Home'),
                      onTap: () {
                        // Handle home navigation
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_circle,
                          color: Color(0xffFD8F02)),
                      title: const Text('Profile'),
                      onTap: () {
                        // Handle profile navigation
                      },
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.settings, color: Color(0xffFD8F02)),
                      title: const Text('Settings'),
                      onTap: () {
                        // Handle settings navigation
                      },
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.logout, color: Color(0xffFD8F02)),
                      title: const Text('Logout'),
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
        body: TabBarView(
          children: [
            // First Tab: Login with Email and Password
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Log in into your existing account",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    // Email Field
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Password Field
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Forgot Password link
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Handle "Forgot Password" action
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xffFD8F02)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Login Button for Email
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Email login action
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();
                          authController.login(
                              email, password); // Call AuthController login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFD8F02),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.login, color: Colors.white),
                        label: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Or"),
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
                      label: const Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // "Don't have an account? Sign up" link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            // Handle sign-up action
                            Get.to(() => const SignUpPage());
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Color(0xffFD8F02)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Second Tab: Login with Phone
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Log in into your existing account",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    // Country Code Picker and Phone Number Field
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CountryCodePicker(
                              onChanged: (countryCode) {
                                selectedCountryCode = countryCode.dialCode!;
                              },
                              initialSelection: 'SY',
                              favorite: const ['+963', 'SY'],
                            ),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Login Button for Phone
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Phone login action
                          final phone =
                              '$selectedCountryCode${phoneController.text.trim()}';
                          final password = passwordController.text.trim();
                          authController.login(phone,
                              password); // Phone login via AuthController
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFD8F02),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.login, color: Colors.white),
                        label: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
