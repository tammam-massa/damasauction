// ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'homescreen.dart';

// class SignUpPage extends StatelessWidget {
//   String selectedCountryCode = '+963'; // Default country code

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: const Color(0xFFF5F5F5),
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Text(
//             "Sign Up",
//             style: TextStyle(color: Color(0xffFD8F02)),
//           ),
//           bottom: const TabBar(
//             labelColor: Color(0xffFD8F02),
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Color(0xffFD8F02),
//             tabs: [
//               Tab(text: "Email"),
//               Tab(text: "Phone"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // First Tab: Sign Up with Email
//             SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Create Your Account",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 20),
//                     // First Name Field
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'User Name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Last Name Field
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Last Name',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Address Field
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Address',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Gender Selection
//                     DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         labelText: 'Gender',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       items: const [
//                         DropdownMenuItem(value: 'male', child: Text('Male')),
//                         DropdownMenuItem(
//                             value: 'female', child: Text('Female')),
//                       ],
//                       onChanged: (value) {},
//                     ),
//                     const SizedBox(height: 10),
//                     // Birthday Field
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Birthday',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         hintText: 'DD/MM/YYYY',
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Email Field
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         prefixIcon: const Icon(Icons.email),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Password Field
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         prefixIcon: const Icon(Icons.lock),
//                         suffixIcon: const Icon(Icons.visibility),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Sign Up Button for Email
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton.icon(
//                         onPressed: () {
//                           // Email sign-up action
//                           Get.to(() => HomeScreen());
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xffFD8F02),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         icon: const Icon(Icons.person_add, color: Colors.white),
//                         label: const Text(
//                           "Sign Up",
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text("Or"),
//                     const SizedBox(height: 10),
//                     // Google Sign-Up button
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         side: const BorderSide(color: Colors.grey),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                       ),
//                       onPressed: () {
//                         // Handle Google sign-up action
//                       },
//                       icon: const FaIcon(
//                         FontAwesomeIcons.google,
//                         color: Colors.red,
//                       ),
//                       label: const Text(
//                         "Sign up with Google",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Second Tab: Sign Up with Phone
//             SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Create Your Account",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 20),
//                     // Country Code Picker and Phone Number Field
//                     TextFormField(
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         prefixIcon: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CountryCodePicker(
//                               onChanged: (countryCode) {
//                                 selectedCountryCode = countryCode.dialCode!;
//                               },
//                               initialSelection: 'SY',
//                               favorite: ['+963', 'SY'],
//                             ),
//                           ],
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Sign Up Button for Phone
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton.icon(
//                         onPressed: () {
//                           // Phone sign-up action
//                           Get.to(() => HomeScreen());
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xffFD8F02),
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         icon: const Icon(Icons.person_add, color: Colors.white),
//                         label: const Text(
//                           "Sign Up",
//                           style: TextStyle(fontSize: 18, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
