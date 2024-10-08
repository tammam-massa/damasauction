// import 'package:damasauction/controllers/auth/auth_controller.dart';
// import 'package:damasauction/core/class/handlingdataview.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:country_code_picker/country_code_picker.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final AuthController authController = Get.put(AuthController());

//   final nameController = TextEditingController();
//   final emailOrPhoneController = TextEditingController();
//   final contactNumberController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final descriptionController = TextEditingController();

//   String selectedCountryCode = '+963'; // Default country code

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF5F5F5),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
//           onPressed: () {
//             Get.back(); // Go back on button press
//           },
//         ),
//         title: const Center(
//           child: Text(
//             "Sign Up",
//             style: TextStyle(color: Color(0xff000000)),
//           ),
//         ),
//       ),
//       body: GetBuilder<AuthController>(
//         builder: (controller) => HandlingDataRequest(
//           statusRequest: controller.statusRequest,
//           widget: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Create Your Account",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 20),

//                   // Name Field
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       hintText: 'Enter your full name',
//                       prefixIcon: const Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Email or Phone Field
//                   TextFormField(
//                     controller: emailOrPhoneController,
//                     decoration: InputDecoration(
//                       labelText: 'Email or Phone',
//                       hintText: 'Enter your email or phone number',
//                       prefixIcon: const Icon(Icons.contact_mail),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Country Code Picker with Phone Number Field
//                   TextFormField(
//                     controller: contactNumberController,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: 'Contact Number',
//                       hintText: 'Enter your contact number',
//                       prefixIcon: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(right: 0),
//                             child: CountryCodePicker(
//                               onChanged: (countryCode) {
//                                 setState(() {
//                                   selectedCountryCode = countryCode.dialCode!;
//                                 });
//                               },
//                               initialSelection: 'SY',
//                               favorite: ['+963', 'SY'],
//                               showFlag: true,
//                               showDropDownButton: true,
//                               padding: const EdgeInsets.all(0),
//                             ),
//                           ),
//                           const VerticalDivider(
//                             color: Colors.grey,
//                             thickness: 1,
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Description Field (Optional)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         '(optional)',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       TextFormField(
//                         controller: descriptionController,
//                         maxLines: 4,
//                         decoration: InputDecoration(
//                           labelText: 'Description',
//                           hintText: 'Enter a short description',
//                           prefixIcon: const Icon(Icons.description),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),

//                   // Password Field
//                   TextFormField(
//                     obscureText: controller
//                         .isshowPassword, // Controls visibility of the password field
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       hintText: 'Enter your password',
//                       prefixIcon: const Icon(Icons.lock), // Lock icon
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           controller.isshowPassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           controller
//                               .showPassword(); // Toggles password visibility
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

// // Confirm Password Field
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: controller
//                         .isshowConfirmPassword, // Controls visibility for confirm password
//                     decoration: InputDecoration(
//                       labelText: 'Confirm Password',
//                       hintText: 'Re-enter your password',
//                       prefixIcon: const Icon(Icons.lock), // Lock icon
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           controller.isshowConfirmPassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           controller
//                               .showConfirmPassword(); // Toggles confirm password visibility
//                         },
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

//                   // Sign Up Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       onPressed: () {
//                         final input = emailOrPhoneController.text.trim();
//                         String? email;
//                         String? phone;

//                         // Check if input is email or phone
//                         if (input.contains('@')) {
//                           email = input;
//                         } else {
//                           phone = selectedCountryCode + input;
//                         }

//                         // Trigger registration via AuthController
//                         controller.register(
//                           nameController.text,
//                           emailOrPhoneController.text,
//                           email!, // Pass email or null
//                           phone, // Pass phone or null
//                           passwordController.text.trim(),
//                           confirmPasswordController.text.trim(),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xff358cde),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       icon: const Icon(Icons.person_add, color: Colors.white),
//                       label: const Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
