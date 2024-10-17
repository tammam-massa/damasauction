// import 'package:damasauction/pages/login/login_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginPage extends StatelessWidget {
//   var nameController = TextEditingController();
//   var passwordController = TextEditingController();
//   LoginController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 80), // For spacing at the top

//               // Login Title
//               const Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 10), // Space between title and subtitle

//               // Subtitle
//               const Text(
//                 'Add your details to log in',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(
//                   height: 40), // Space between subtitle and input fields

//               // Email Input
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Your Email or Mobile No',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xfff2f2f2),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               // Password Input
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: const Color(0xfff2f2f2),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 10),

//               // Forgot Password Link
//               Align(
//                 alignment: Alignment.center,
//                 child: TextButton(
//                   onPressed: () {
//                     Get.toNamed(
//                         '/forgot-password'); // Navigate to Forgot Password page
//                   },
//                   child: const Text(
//                     'Forgot your password?',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Login Button
//               Obx(
//                 () => controller.loadinglogin.isTrue
//                     ? const Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : ElevatedButton(
//                         onPressed: () {
//                           final name = nameController.text;
//                           final password = passwordController.text;
//                           controller.loginOnClick(name, password);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           backgroundColor: Colors.pink,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//               ),

//               const SizedBox(height: 10), // Space between button and login link

//               // Don't have an account? Sign Up
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don't have an Account?",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Get.offAllNamed('/signup');
//                     },
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:damasauction/pages/captcha/recaptcha_webview.dart';
import 'package:damasauction/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              const Text('Login',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              const Text('Add your details to log in',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center),
              const SizedBox(height: 40),

              // Email Input
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Your Email or Mobile No',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xfff2f2f2),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 30),

              // Password Input
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xfff2f2f2),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 10),

              // Forgot Password Link
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('/forgot-password');
                  },
                  child: const Text('Forgot your password?',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // Login Button
              Obx(
                () => controller.loadinglogin.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () async {
                          final name = nameController.text;
                          final password = passwordController.text;

                          // Navigate to reCAPTCHA WebView and pass username and password
                          final recaptchaResult = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecaptchaWebView(
                                  username: name, password: password),
                            ),
                          );

                          // Check if reCAPTCHA was solved successfully
                          if (recaptchaResult == 'recaptchaSolved') {
                            // Proceed with login after reCAPTCHA validation
                            await controller.loginOnClick(name,
                                password); // Call your existing login logic
                          } else {
                            // Handle failure (optional, e.g., show error message)
                            Get.snackbar(
                                'Error', 'reCAPTCHA verification failed',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text('Login',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
              ),

              const SizedBox(height: 10),

              // Don't have an account? Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed('/signup');
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
