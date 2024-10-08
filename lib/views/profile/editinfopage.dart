// import 'package:damasauction/widgets/profile/profile_edit_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EditInfoPage extends StatelessWidget {
//   const EditInfoPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('edit_info'.tr),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         backgroundColor: const Color(0xFFF2F2F2),
//       ),
//       body: Container(
//         color: const Color(0xFFF2F2F2), // Background color
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.grey[300],
//                       child: const Icon(Icons.person,
//                           size: 50, color: Colors.grey),
//                     ),
//                     const Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         child: Icon(Icons.edit, color: Colors.grey),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ProfileEditField(
//                 label: 'name'.tr,
//                 hintText: 'name'.tr,
//               ),
//               const SizedBox(height: 20),
//               ProfileEditField(
//                 label: 'email'.tr,
//                 optionalText: '(Optional)'.tr,
//                 hintText: 'email'.tr,
//               ),
//               const SizedBox(height: 20),
//               ProfileEditField(
//                 label: 'short_description_about_you'.tr,
//                 optionalText: '(Optional)'.tr,
//                 hintText: 'Short description about you'.tr,
//                 maxLines: 3,
//               ),
//               const SizedBox(height: 20),
//               ProfileEditField(
//                 label: 'select_location'.tr,
//                 optionalText: '(Optional)'.tr,
//                 hintText: 'select_location'.tr,
//                 suffixIcon: const Icon(Icons.location_on, color: Colors.grey),
//               ),
//               const SizedBox(height: 30),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 50),
//                     backgroundColor: const Color(0xff358cde),
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       side: BorderSide.none, // Clear shadow
//                     ),
//                   ),
//                   child: Text('update'.tr),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:damasauction/controllers/profile/profile_controller.dart';
import 'package:damasauction/widgets/profile/profile_edit_text.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditInfoPage extends StatefulWidget {
  const EditInfoPage({super.key});

  @override
  EditInfoPageState createState() => EditInfoPageState();
}

class EditInfoPageState extends State<EditInfoPage> {
  final ProfileController profileController = Get.find<ProfileController>();
  String? _imagePath; // Variable to hold the image path

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(
        source: ImageSource
            .gallery, // Change to ImageSource.camera for camera access
      );

      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path; // Update the image path
        });
      }
    } catch (e) {
      Get.snackbar(
        'error'.tr,
        'failed_to_pick_image: $e'.tr,
        backgroundColor: const Color(0xFF000000), // Background color
        colorText: const Color(0xFFffffff), // Text color
        icon: const Icon(
          Icons.check_circle_outline, // Add an icon
          color: Color(0xFFffffff), // Icon color
        ),
        snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
        borderRadius: 12, // Rounded corners
        margin: const EdgeInsets.all(16), // Padding around the snackbar
        duration: const Duration(seconds: 3), // Duration to show the snackbar
      );
    }
  }

  Future<void> _saveProfile() async {
    // Implement the logic to save the profile updates
    if (_imagePath != null) {
      // If an image was picked, you can upload it to your server
      // Add your upload logic here
    }

    // For demonstration, let's say the update is successful

    Get.snackbar(
      'success'.tr,
      'profile_updated_successfully'.tr,
      backgroundColor: const Color(0xFF000000), // Background color
      colorText: const Color(0xFFffffff), // Text color
      icon: const Icon(
        Icons.check_circle_outline, // Add an icon
        color: Color(0xFFffffff), // Icon color
      ),
      snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
      borderRadius: 12, // Rounded corners
      margin: const EdgeInsets.all(16), // Padding around the snackbar
      duration: const Duration(seconds: 3), // Duration to show the snackbar
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('edit_info'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xFFF2F2F2),
      ),
      body: Container(
        color: const Color(0xFFF2F2F2), // Background color
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          // Show loading indicator while fetching profile data
          if (profileController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // Once the data is loaded, show the form with the fetched values
          final profile = profileController.profile.value;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: _imagePath != null
                            ? ClipOval(
                                child: Image.file(
                                  File(_imagePath!),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : profile?.photo != null
                                ? ClipOval(
                                    child: Image.network(
                                      profile!.photo!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(Icons.person,
                                    size: 50, color: Colors.grey),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage, // Call the method to pick an image
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ProfileEditField(
                  label: 'name'.tr,
                  hintText: 'name'.tr,
                  initialValue: profile?.name ?? '', // Bind the name
                ),
                const SizedBox(height: 20),
                ProfileEditField(
                  label: 'email'.tr,
                  optionalText: '(Optional)'.tr,
                  hintText: 'email'.tr,
                  initialValue: profile?.email ?? '', // Bind the email
                ),
                const SizedBox(height: 20),
                ProfileEditField(
                  label: 'short_description_about_you'.tr,
                  optionalText: '(Optional)'.tr,
                  hintText: 'short_description_about_you'.tr,
                  maxLines: 3,
                  initialValue: '', // Placeholder for description
                ),
                const SizedBox(height: 20),
                ProfileEditField(
                  label: 'select_location'.tr,
                  optionalText: '(Optional)'.tr,
                  hintText: 'select_location'.tr,
                  suffixIcon: const Icon(Icons.location_on, color: Colors.grey),
                  initialValue: '', // Placeholder for location
                ),
                const SizedBox(height: 30),
                Center(
                    child: ActionButton(
                        text: 'update'.tr,
                        iconData: Icons.update,
                        onPressed: _saveProfile,
                        backgroundColor: const Color(0xff358cde))),
              ],
            ),
          );
        }),
      ),
    );
  }
}
