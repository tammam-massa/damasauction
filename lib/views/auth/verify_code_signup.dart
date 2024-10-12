
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';

// class VerifyCodeSignUp extends StatelessWidget {
//   const VerifyCodeSignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(VerifyCodeSignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.primaryColor,
//         elevation: 0.0,
//         centerTitle: true,
//         title: Text(
//           "73".tr,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: GetBuilder<VerifyCodeSignUpControllerImp>(
//         builder: (controller) => HandlingDataRequest(
//           statusRequest: controller.statusRequest,
//           widget: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
//             child: ListView(
//               children: [
//                 CustomTextTitleAuth(text: "74".tr),
//                 const SizedBox(height: 20),
//                 CustomTextBodyAuth(text: '${"75".tr} ${controller.email}'),
//                 const SizedBox(height: 15),
//                 Directionality(
//                   textDirection:
//                       TextDirection.ltr, // Set left-to-right direction
//                   child: OtpTextField(
//                     fieldWidth: 50.0,
//                     borderRadius: BorderRadius.circular(20),
//                     numberOfFields: 5,
//                     borderColor: const Color(0xFF512DA8),
//                     showFieldAsBox: true,
//                     onCodeChanged: (String code) {
//                       // Handle validation or checks here
//                     },
//                     onSubmit: (String verificationCode) {
//                       controller.goToSuccessSignUp(verificationCode);
//                     }, // End onSubmit
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       controller.reSend();
//                     },
//                     child: Text(
//                       "76".tr,
//                       style: const TextStyle(
//                         color: AppColor.primaryColor,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
