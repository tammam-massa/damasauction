// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:damasauction/views/ads/ads_success_page.dart';
// import 'package:damasauction/widgets/ads/custom_ad_text.dart';
// import 'package:damasauction/widgets/shared/actionbutton.dart';
// import 'dart:convert';

// class ChooseAdsImagePage extends StatefulWidget {
//   const ChooseAdsImagePage({super.key});

//   @override
//   ChooseAdsImagePageState createState() => ChooseAdsImagePageState();
// }

// final TextEditingController descriptionController = TextEditingController();
// final TextEditingController keywordsController = TextEditingController();
// final TextEditingController biddingStartTimeController =
//     TextEditingController();
// final TextEditingController startingPriceController = TextEditingController();
// final TextEditingController minIncreasePriceController =
//     TextEditingController();

// class ChooseAdsImagePageState extends State<ChooseAdsImagePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> animation;
//   bool _isLoading = false; // To track API call progress

//   final ImagePicker _picker = ImagePicker();
//   File? _selectedImage;

//   @override
//   void initState() {
//     super.initState();
//     // Retrieve the passed data from the previous page
//     final int? categoryId = Get.arguments['categoryId'];
//     final int? cityId = Get.arguments['cityId']; // City ID passed correctly
//     final Map<int, String?> selectedAttributes = Get.arguments['attributes'];
//     final String itemName = Get.arguments['itemName'];

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..repeat(reverse: true);

//     animation =
//         Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     descriptionController.dispose();
//     startingPriceController.dispose();
//     minIncreasePriceController.dispose();
//     keywordsController.dispose();
//     biddingStartTimeController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//       });
//     }
//   }

//   Future<void> _submitAd() async {
//     setState(() {
//       _isLoading = true; // Start loading
//     });

//     final Uri apiUrl = Uri.parse(
//         'https://api.mazaddimashq.com/api/item/create-item'); // API URL

//     try {
//       // Build form data
//       final request = http.MultipartRequest('POST', apiUrl)
//         ..fields['category_id'] = Get.arguments['categoryId'].toString()
//         ..fields['city_id'] = Get.arguments['cityId'].toString() // Pass cityId
//         ..fields['starting_price'] = startingPriceController.text
//         ..fields['min_increase_price'] = minIncreasePriceController.text
//         ..fields['description'] = descriptionController.text
//         ..fields['keywords'] = keywordsController.text
//         ..fields['bidding_start_time'] = biddingStartTimeController.text
//         ..fields['attributes'] =
//             jsonEncode(Get.arguments['attributes']) // Add attributes as JSON
//         ..fields['name'] = Get.arguments['itemName']
//         // Add Authorization header with the token
//         ..headers['Authorization'] =
//             'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tYXphZGRpbWFzaHEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI4NTk2NTk0LCJleHAiOjE3Mjg2MDAxOTQsIm5iZiI6MTcyODU5NjU5NCwianRpIjoiVFJFUHZvZXlHcnduTG1YOSIsInN1YiI6IjczIiwicHJ2IjoiZTRmZDk3NDcwMGI0NmJmYmE1ZjYwOTc2ODQxNTkyZGE2YmY4MTM1ZSJ9.WjrWIlgkdcpJyZzkT4F9OWck1S4uj4v_hNwOktG8I9Y';

//       // Add image file if selected
//       if (_selectedImage != null) {
//         request.files.add(await http.MultipartFile.fromPath(
//           'image',
//           _selectedImage!.path,
//         ));
//       }

//       // Send the request
//       final response = await request.send();

//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final responseData = json.decode(responseBody);

//         if (responseData['success']) {
//           // Navigate to success page if the API call was successful
//           Get.to(
//             const AdsSuccessPage(),
//             arguments: {
//               'categoryId': Get.arguments['categoryId'],
//               'cityId': Get.arguments['cityId'], // Pass cityId
//               'attributes': Get.arguments['attributes'],
//               'itemName': Get.arguments['itemName'],
//             },
//           );
//         } else {
//           // Show API error message if available
//           Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
//         }
//       } else {
//         // Log the actual error response details
//         final responseBody = await response.stream.bytesToString();
//         print('Error: ${response.statusCode}, Body: $responseBody');

//         Get.snackbar('Error',
//             'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
//       }
//     } catch (e) {
//       // Log the error
//       print('Exception: $e');
//       Get.snackbar('Error', 'An error occurred: $e');
//     } finally {
//       setState(() {
//         _isLoading = false; // Stop loading
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFf3f3f3),
//       appBar: AppBar(
//         scrolledUnderElevation: 0.0,
//         backgroundColor: const Color(0xFFf3f3f3),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           'back'.tr,
//           style: const TextStyle(
//             fontSize: 16,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.close, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AnimatedBuilder(
//                 animation: _animationController,
//                 builder: (context, child) {
//                   return LinearProgressIndicator(
//                     minHeight: 10,
//                     value: 1,
//                     backgroundColor: Colors.grey[200],
//                     valueColor:
//                         const AlwaysStoppedAnimation<Color>(Color(0xff358cde)),
//                   );
//                 },
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "step 3".tr,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Choose a picture ",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color.fromARGB(255, 8, 7, 7),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: Container(
//                   height: 80,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Center(
//                     child: _selectedImage != null
//                         ? Image.file(_selectedImage!, fit: BoxFit.cover)
//                         : const Icon(Icons.add, size: 50, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               CustomAdTextField(
//                 controller: startingPriceController,
//                 label: 'starting_price'.tr,
//                 hint: 'enter_starting_price'.tr,
//                 keyboardType: TextInputType.number,
//               ),
//               CustomAdTextField(
//                 controller: minIncreasePriceController,
//                 label: 'minimum_Price_increment'.tr,
//                 hint: 'enter_minimum_price_increment'.tr,
//                 keyboardType: TextInputType.number,
//               ),
//               CustomAdTextField(
//                 controller: descriptionController,
//                 label: 'item_description'.tr,
//                 hint: 'enter_item_description'.tr,
//                 keyboardType: TextInputType.text,
//               ),
//               CustomAdTextField(
//                 controller: keywordsController,
//                 label: 'keywords'.tr,
//                 hint: 'enter_keywords_for_the_item'.tr,
//                 keyboardType: TextInputType.text,
//               ),
//               CustomAdTextField(
//                 controller: biddingStartTimeController,
//                 label: 'bidding_start_time'.tr,
//                 hint: 'enter_bidding_start_time_(YYYY-MM-DD HH:MM)'.tr,
//                 keyboardType: TextInputType.datetime,
//               ),
//               const SizedBox(height: 5),
//               _isLoading // Show loading spinner while submitting the ad
//                   ? const Center(child: CircularProgressIndicator())
//                   : SizedBox(
//                       width: double.infinity,
//                       child: ActionButton(
//                         text: 'next'.tr,
//                         onPressed: () {
//                           if (_selectedImage == null ||
//                               startingPriceController.text.isEmpty) {
//                             Get.snackbar(
//                               'Error',
//                               'Please provide all necessary information.',
//                               snackPosition: SnackPosition.BOTTOM,
//                             );
//                           } else {
//                             _submitAd(); // Call the API before navigating to success page
//                           }
//                         },
//                         backgroundColor: const Color(0xff358cde),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:damasauction/views/ads/ads_success_page.dart';
// import 'package:damasauction/widgets/ads/custom_ad_text.dart';
// import 'package:damasauction/widgets/shared/actionbutton.dart';
// import 'dart:convert';

// class ChooseAdsImagePage extends StatefulWidget {
//   const ChooseAdsImagePage({super.key});

//   @override
//   ChooseAdsImagePageState createState() => ChooseAdsImagePageState();
// }

// final TextEditingController descriptionController = TextEditingController();
// final TextEditingController keywordsController = TextEditingController();
// final TextEditingController biddingStartTimeController =
//     TextEditingController();
// final TextEditingController startingPriceController = TextEditingController();
// final TextEditingController minIncreasePriceController =
//     TextEditingController();

// class ChooseAdsImagePageState extends State<ChooseAdsImagePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> animation;
//   bool _isLoading = false;

//   final ImagePicker _picker = ImagePicker();
//   File? _selectedImage;
//   List<XFile>? _selectedImages;

//   Future<void> _pickImages() async {
//     final ImagePicker picker = ImagePicker();
//     // Allow multiple images selection
//     final List<XFile>? images = await picker.pickMultiImage();
//     if (images != null) {
//       setState(() {
//         _selectedImages = images; // Assign selected images
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Initialize animation controller
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..repeat(reverse: true);
//     animation =
//         Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     // Dispose of the controllers to free resources
//     descriptionController.dispose();
//     startingPriceController.dispose();
//     minIncreasePriceController.dispose();
//     keywordsController.dispose();
//     biddingStartTimeController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//       });
//     }
//   }
// //correct
//   // Future<void> _submitAd() async {
//   //   setState(() {
//   //     _isLoading = true;
//   //   });

//   //   final Uri apiUrl =
//   //       Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

//   //   try {
//   //     final request = http.MultipartRequest('POST', apiUrl)
//   //       ..fields['category_id'] = Get.arguments['categoryId'].toString()
//   //       ..fields['city_id'] = Get.arguments['cityId'].toString()
//   //       ..fields['starting_price'] = startingPriceController.text
//   //       ..fields['min_increase_price'] = minIncreasePriceController.text
//   //       ..fields['description'] = descriptionController.text
//   //       ..fields['keywords'] = keywordsController.text
//   //       ..fields['bidding_start_time'] = biddingStartTimeController.text
//   //       ..fields['name'] = Get.arguments['itemName']
//   //       ..headers['Authorization'] =
//   //           'Bearer YOUR_TOKEN'; // Replace with your token

//   //     // Check and process attributes data
//   //     var attributes = Get.arguments['attributes'];
//   //     print('Attributes: $attributes'); // Debugging line

//   //     // Ensure we work with a List of Maps
//   //     List<Map<String, String>> attributeList = [];

//   //     if (attributes is Map<int, String?>) {
//   //       // If attributes is a Map<int, String?>, process it
//   //       attributes.forEach((key, value) {
//   //         attributeList.add({
//   //           'id': key.toString(),
//   //           'value': value ??
//   //               '', // Ensure value is non-null, default to empty string if null
//   //         });
//   //       });
//   //     } else {
//   //       // Handle unexpected types
//   //       print('Unexpected attributes type: ${attributes.runtimeType}');
//   //     }

//   //     // Log the final structure of attributes
//   //     print('Processed Attributes: $attributeList');

//   //     // Add attributes to the request fields as JSON
//   //     request.fields['attributes'] = jsonEncode(attributeList);

//   //     // Add image if selected
//   //     if (_selectedImage != null) {
//   //       request.files.add(await http.MultipartFile.fromPath(
//   //         'image',
//   //         _selectedImage!.path,
//   //       ));
//   //     }

//   //     // Send the request
//   //     final response = await request.send();

//   //     // Handle response
//   //     if (response.statusCode == 200) {
//   //       final responseBody = await response.stream.bytesToString();
//   //       final responseData = json.decode(responseBody);

//   //       if (responseData['success']) {
//   //         Get.to(
//   //           const AdsSuccessPage(),
//   //           arguments: {
//   //             'categoryId': Get.arguments['categoryId'],
//   //             'cityId': Get.arguments['cityId'],
//   //             'attributes': Get.arguments['attributes'],
//   //             'itemName': Get.arguments['itemName'],
//   //           },
//   //         );
//   //       } else {
//   //         Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
//   //       }
//   //     } else {
//   //       final responseBody = await response.stream.bytesToString();
//   //       Get.snackbar('Error',
//   //           'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
//   //     }
//   //   } catch (e) {
//   //     Get.snackbar('Error', 'An error occurred: $e');
//   //   } finally {
//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //   }
//   //}
//   Future<void> _submitAd() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final Uri apiUrl =
//         Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

//     // Ensure images are selected
//     if (_selectedImages == null || _selectedImages!.isEmpty) {
//       print('No images selected.');
//       Get.snackbar('Error', 'Please select at least one image.');
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     // Validate city ID
//     final cityId = Get.arguments['cityId'];
//     List<int> validCityIds = [1, 2, 3]; // Replace with your valid IDs

//     if (!validCityIds.contains(int.parse(cityId))) {
//       Get.snackbar('Error', 'Invalid city ID selected.');
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     try {
//       final Map<String, dynamic> attributes = Get.arguments['attributes']
//           .map<String, dynamic>(
//               (key, value) => MapEntry(key.toString(), value));

//       final request = http.MultipartRequest('POST', apiUrl)
//         ..fields['category_id'] = Get.arguments['categoryId'].toString()
//         ..fields['city_id'] = cityId.toString()
//         ..fields['starting_price'] = startingPriceController.text
//         ..fields['min_increase_price'] = minIncreasePriceController.text
//         ..fields['description'] = descriptionController.text
//         ..fields['keywords'] = keywordsController.text
//         ..fields['bidding_start_time'] = biddingStartTimeController.text
//         ..fields['attributes'] = jsonEncode(attributes)
//         ..fields['name'] = Get.arguments['itemName']
//         ..headers['Authorization'] =
//             'Bearer your_token_here'; // Replace with your token

//       // Add images if selected
//       for (var image in _selectedImages!) {
//         request.files.add(await http.MultipartFile.fromPath(
//           'photos[]', // Change to the expected field name
//           image.path,
//         ));
//       }

//       // Send the request
//       final response = await request.send();

//       // Handle response
//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final responseData = json.decode(responseBody);

//         if (responseData['success']) {
//           Get.to(
//             const AdsSuccessPage(),
//             arguments: {
//               'categoryId': Get.arguments['categoryId'],
//               'cityId': Get.arguments['cityId'],
//               'attributes': Get.arguments['attributes'],
//               'itemName': Get.arguments['itemName'],
//             },
//           );
//           print('Success: Ad submitted successfully');
//         } else {
//           print('Error: ${responseData['message'] ?? 'Unknown error'}');
//           Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
//         }
//       } else {
//         final responseBody = await response.stream.bytesToString();
//         print(
//             'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
//         Get.snackbar('Error',
//             'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
//       }
//     } catch (e) {
//       print('Error: An error occurred: $e');
//       Get.snackbar('Error', 'An error occurred: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFf3f3f3),
//       appBar: AppBar(
//         scrolledUnderElevation: 0.0,
//         backgroundColor: const Color(0xFFf3f3f3),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           'back'.tr,
//           style: const TextStyle(
//             fontSize: 16,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.close, color: Colors.black),
//             onPressed: () {
//               // Optional: Add functionality for closing the page
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Animation Progress Indicator
//               AnimatedBuilder(
//                 animation: _animationController,
//                 builder: (context, child) {
//                   return LinearProgressIndicator(
//                     minHeight: 10,
//                     value: 1,
//                     backgroundColor: Colors.grey[200],
//                     valueColor:
//                         const AlwaysStoppedAnimation<Color>(Color(0xff358cde)),
//                   );
//                 },
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 "step 3".tr,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Choose a picture",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color.fromARGB(255, 8, 7, 7),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: Container(
//                   height: 80,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Center(
//                     child: _selectedImage != null
//                         ? Image.file(_selectedImage!, fit: BoxFit.cover)
//                         : const Icon(Icons.add, size: 50, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 5),
//               CustomAdTextField(
//                 controller: startingPriceController,
//                 label: 'starting_price'.tr,
//                 hint: 'enter_starting_price'.tr,
//                 keyboardType: TextInputType.number,
//               ),
//               CustomAdTextField(
//                 controller: minIncreasePriceController,
//                 label: 'minimum_Price_increment'.tr,
//                 hint: 'enter_minimum_price_increment'.tr,
//                 keyboardType: TextInputType.number,
//               ),
//               CustomAdTextField(
//                 controller: descriptionController,
//                 label: 'item_description'.tr,
//                 hint: 'enter_item_description'.tr,
//                 keyboardType: TextInputType.text,
//               ),
//               CustomAdTextField(
//                 controller: biddingStartTimeController,
//                 label: 'bidding_start_time'.tr,
//                 hint: 'enter_bidding_start_time'.tr,
//                 keyboardType: TextInputType.datetime,
//               ),
//               CustomAdTextField(
//                 controller: keywordsController,
//                 label: 'keywords'.tr,
//                 hint: 'enter_keywords'.tr,
//                 keyboardType: TextInputType.text,
//               ),
//               const Spacer(),
//               ActionButton(
//                   text: 'create_ad'.tr,
//                   onPressed: _isLoading ? null : _submitAd,
//                   backgroundColor: const Color(0xff358cde)),
//               if (_isLoading) const LinearProgressIndicator(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//previous is good code

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:damasauction/views/ads/ads_success_page.dart';
// import 'package:damasauction/widgets/ads/custom_ad_text.dart';
// import 'package:damasauction/widgets/shared/actionbutton.dart';
// import 'dart:convert';

// class ChooseAdsImagePage extends StatefulWidget {
//   const ChooseAdsImagePage({super.key});

//   @override
//   ChooseAdsImagePageState createState() => ChooseAdsImagePageState();
// }

// final TextEditingController descriptionController = TextEditingController();
// final TextEditingController keywordsController = TextEditingController();
// final TextEditingController biddingStartTimeController =
//     TextEditingController();
// final TextEditingController startingPriceController = TextEditingController();
// final TextEditingController minIncreasePriceController =
//     TextEditingController();

// class ChooseAdsImagePageState extends State<ChooseAdsImagePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> animation;
//   bool _isLoading = false;

//   final ImagePicker _picker = ImagePicker();
//   File? _selectedImage;
//   List<XFile>? _selectedImages;
//   String _uploadedImageUrl = '';

//   Future<void> _pickImages() async {
//     final ImagePicker picker = ImagePicker();
//     final List<XFile>? images = await picker.pickMultiImage();
//     if (images != null) {
//       setState(() {
//         _selectedImages = images;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..repeat(reverse: true);
//     animation =
//         Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     descriptionController.dispose();
//     startingPriceController.dispose();
//     minIncreasePriceController.dispose();
//     keywordsController.dispose();
//     biddingStartTimeController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickImage() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//       });
//       await _uploadImage(_selectedImage!);
//     }
//   }

//   Future<void> _uploadImage(File image) async {
//     try {
//       final Uri uploadUrl =
//           Uri.parse('https://api.mazaddimashq.com/images/orginal/');
//       final request = http.MultipartRequest('POST', uploadUrl)
//         ..files.add(await http.MultipartFile.fromPath('image', image.path));

//       final response = await request.send();

//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final jsonResponse = json.decode(responseBody);
//         setState(() {
//           _uploadedImageUrl = jsonResponse['url']; // Parse the image URL
//         });
//         print('Image uploaded successfully: $_uploadedImageUrl');
//       } else {
//         print('Error: Failed to upload image.');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> _submitAd() async {
//     setState(() {
//       _isLoading = true;
//     });

//     final Uri apiUrl =
//         Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

//     if (_selectedImages == null || _selectedImages!.isEmpty) {
//       Get.snackbar('Error', 'Please select at least one image.');
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     final cityId = Get.arguments['cityId'];
//     List<int> validCityIds = [1, 2, 3]; // Replace with your valid IDs

//     if (!validCityIds.contains(int.parse(cityId))) {
//       Get.snackbar('Error', 'Invalid city ID selected.');
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     try {
//       final Map<String, dynamic> attributes = Get.arguments['attributes']
//           .map<String, dynamic>(
//               (key, value) => MapEntry(key.toString(), value));

//       final request = http.MultipartRequest('POST', apiUrl)
//         ..fields['category_id'] = Get.arguments['categoryId'].toString()
//         ..fields['city_id'] = cityId.toString()
//         ..fields['starting_price'] = startingPriceController.text
//         ..fields['min_increase_price'] = minIncreasePriceController.text
//         ..fields['description'] = descriptionController.text
//         ..fields['keywords'] = keywordsController.text
//         ..fields['bidding_start_time'] = biddingStartTimeController.text
//         ..fields['attributes'] = jsonEncode(attributes)
//         ..fields['name'] = Get.arguments['itemName']
//         ..fields['image_url'] = _uploadedImageUrl // Pass uploaded image URL
//         ..headers['Authorization'] =
//             'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tYXphZGRpbWFzaHEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI4NjY5MzIwLCJleHAiOjE3Mjg2NzI5MjAsIm5iZiI6MTcyODY2OTMyMCwianRpIjoiR3BiN3pZeEhQRzVkMURUTSIsInN1YiI6IjczIiwicHJ2IjoiZTRmZDk3NDcwMGI0NmJmYmE1ZjYwOTc2ODQxNTkyZGE2YmY4MTM1ZSJ9.35NPswl58ajsqXpgosqlqyXD4hEe2NcM1dZ87hmjuRY';

//       for (var image in _selectedImages!) {
//         request.files.add(await http.MultipartFile.fromPath(
//           'photos[]', // Change to the expected field name
//           image.path,
//         ));
//       }

//       final response = await request.send();

//       if (response.statusCode == 200) {
//         final responseBody = await response.stream.bytesToString();
//         final responseData = json.decode(responseBody);

//         if (responseData['success']) {
//           Get.to(
//             const AdsSuccessPage(),
//             arguments: {
//               'categoryId': Get.arguments['categoryId'],
//               'cityId': Get.arguments['cityId'],
//               'attributes': Get.arguments['attributes'],
//               'itemName': Get.arguments['itemName'],
//             },
//           );
//         } else {
//           Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
//         }
//       } else {
//         final responseBody = await response.stream.bytesToString();
//         Get.snackbar('Error',
//             'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFf3f3f3),
//       appBar: AppBar(
//         scrolledUnderElevation: 0.0,
//         backgroundColor: const Color(0xFFf3f3f3),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           'back'.tr,
//           style: const TextStyle(fontSize: 16, color: Colors.black),
//         ),
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.close, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AnimatedBuilder(
//                   animation: _animationController,
//                   builder: (context, child) {
//                     return LinearProgressIndicator(
//                       minHeight: 10,
//                       value: 1,
//                       backgroundColor: Colors.grey[200],
//                       valueColor: const AlwaysStoppedAnimation<Color>(
//                           Color(0xff358cde)),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   "step 3".tr,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "Choose a picture",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Color.fromARGB(255, 8, 7, 7),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: _pickImage,
//                   child: Container(
//                     height: 80,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.grey),
//                     ),
//                     child: Center(
//                       child: _selectedImage != null
//                           ? Image.file(_selectedImage!, fit: BoxFit.cover)
//                           : const Icon(Icons.add, size: 50, color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 CustomAdTextField(
//                   controller: startingPriceController,
//                   label: 'starting_price'.tr,
//                   hint: 'enter_starting_price'.tr,
//                   keyboardType: TextInputType.number,
//                 ),
//                 CustomAdTextField(
//                   controller: minIncreasePriceController,
//                   label: 'minimum_Price_increment'.tr,
//                   hint: 'enter_minimum_price_increment'.tr,
//                   keyboardType: TextInputType.number,
//                 ),
//                 CustomAdTextField(
//                   controller: descriptionController,
//                   label: 'item_description'.tr,
//                   hint: 'enter_item_description'.tr,
//                   keyboardType: TextInputType.text,
//                 ),
//                 CustomAdTextField(
//                   controller: biddingStartTimeController,
//                   label: 'bidding_start_time'.tr,
//                   hint: 'enter_bidding_start_time'.tr,
//                   keyboardType: TextInputType.datetime,
//                 ),
//                 CustomAdTextField(
//                   controller: keywordsController,
//                   label: 'keywords'.tr,
//                   hint: 'enter_keywords'.tr,
//                   keyboardType: TextInputType.text,
//                 ),
//                 const SizedBox(height: 20),
//                 _isLoading
//                     ? const Center(child: CircularProgressIndicator())
//                     : ActionButton(
//                         text: 'create_listing'.tr,
//                         onPressed: _submitAd,
//                         backgroundColor: Colors.black,
//                       ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:damasauction/views/ads/ads_success_page.dart';
import 'package:damasauction/widgets/ads/custom_ad_text.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'dart:convert';
import 'package:path/path.dart';

class ChooseAdsImagePage extends StatefulWidget {
  const ChooseAdsImagePage({super.key});

  @override
  ChooseAdsImagePageState createState() => ChooseAdsImagePageState();
}

final TextEditingController descriptionController = TextEditingController();
final TextEditingController keywordsController = TextEditingController();
final TextEditingController biddingStartTimeController =
    TextEditingController();
final TextEditingController startingPriceController = TextEditingController();
final TextEditingController minIncreasePriceController =
    TextEditingController();

class ChooseAdsImagePageState extends State<ChooseAdsImagePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  bool _isLoading = false;

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  List<XFile>? _selectedImages;

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _selectedImages = images;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    descriptionController.dispose();
    startingPriceController.dispose();
    minIncreasePriceController.dispose();
    keywordsController.dispose();
    biddingStartTimeController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _submitAd() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    final Uri apiUrl =
        Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

    // Ensure images are selected
    if (_selectedImages == null || _selectedImages!.isEmpty) {
      print('No images selected.');
      Get.snackbar('Error', 'Please select at least one image.');
      setState(() {
        _isLoading = false; // Stop loading if no images
      });
      return;
    }

    // Validate city ID
    final String cityId =
        Get.arguments['cityId'].toString(); // Convert to String
    List<String> validCityIds = ['1', '2', '3']; // Ensure city IDs are Strings

    if (!validCityIds.contains(cityId)) {
      Get.snackbar('Error', 'Invalid city ID selected.');
      setState(() {
        _isLoading = false; // Stop loading if invalid city ID
      });
      return;
    }

    try {
      // Print the description and check if it's null
      print('Description: ${descriptionController.text}');
      if (descriptionController.text.isEmpty) {
        Get.snackbar('Error', 'Please provide a description.');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Print how many images are being attached
      print('Attaching ${_selectedImages!.length} images');

      // Prepare attributes as a list
      final List<Map<String, dynamic>> attributes =
          List.from(Get.arguments['attributes']);

      final request = http.MultipartRequest('POST', apiUrl)
        ..fields['category_id'] = Get.arguments['categoryId'].toString()
        ..fields['city_id'] = cityId
        ..fields['starting_price'] = startingPriceController.text
        ..fields['min_increase_price'] = minIncreasePriceController.text
        ..fields['description'] = descriptionController.text
        ..fields['keywords'] = keywordsController.text
        ..fields['bidding_start_time'] = biddingStartTimeController.text
        ..fields['attributes'] = jsonEncode(
            attributes) // Ensure this is correctly formatted as an array
        ..fields['name'] = Get.arguments['itemName']
        ..headers['Authorization'] =
            'Bearer <eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS5tYXphZGRpbWFzaHEuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI4NjkzODI5LCJleHAiOjE3Mjg2OTc0MjksIm5iZiI6MTcyODY5MzgyOSwianRpIjoiQ21GMDNBTVB5SnRrVTFtZSIsInN1YiI6IjczIiwicHJ2IjoiZTRmZDk3NDcwMGI0NmJmYmE1ZjYwOTc2ODQxNTkyZGE2YmY4MTM1ZSJ9.LK2mEh2V2LARHbdY2_orfW3Ei-n8lUDhzXg-MGOtGNo">'; // Replace with actual token

      // Add selected images as 'photos'
      for (var image in _selectedImages!) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          'photos[]', // Field name for images
          stream,
          length,
          filename: basename(image.path),
        );
        request.files.add(multipartFile);
      }

      // Send the request
      print(
          'Sending request to: $apiUrl'); // Debugging: Check if request is sent
      final response = await request.send();

      // Handle response
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseData = json.decode(responseBody);

        if (responseData['success']) {
          print('Ad submitted successfully'); // Debugging: Log success
          Get.to(
            const AdsSuccessPage(),
            arguments: {
              'categoryId': Get.arguments['categoryId'],
              'cityId': Get.arguments['cityId'],
              'attributes': Get.arguments['attributes'],
              'itemName': Get.arguments['itemName'],
            },
          );
        } else {
          print(
              'Error: ${responseData['message'] ?? 'Unknown error'}'); // Debugging: Log error message
          Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
        }
      } else {
        final responseBody = await response.stream.bytesToString();
        print(
            'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
        Get.snackbar('Error',
            'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
      }
    } catch (e) {
      print('Error occurred: $e'); // Debugging: Log any exceptions
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: const Color(0xFFf3f3f3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'back'.tr,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Optional: Add functionality for closing the page
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return LinearProgressIndicator(
                      minHeight: 10,
                      value: 1,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff358cde)),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  "step 3".tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // const SizedBox(height: 10),
                // const Text(
                //   "Choose a picture",
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Color.fromARGB(255, 8, 7, 7),
                //   ),
                // ),
                // const SizedBox(height: 10),
                // GestureDetector(
                //   onTap: _pickImage,
                //   child: Container(
                //     height: 80,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(color: Colors.grey),
                //     ),
                //     child: Center(
                //       child: _selectedImage != null
                //           ? Image.file(_selectedImage!, fit: BoxFit.cover)
                //           : const Icon(Icons.add, size: 50, color: Colors.grey),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 5),
                CustomAdTextField(
                  controller: startingPriceController,
                  label: 'starting_price'.tr,
                  hint: 'enter_starting_price'.tr,
                  keyboardType: TextInputType.number,
                ),
                CustomAdTextField(
                  controller: minIncreasePriceController,
                  label: 'min_increase_price'.tr,
                  hint: 'enter_min_increase_price'.tr,
                  keyboardType: TextInputType.number,
                ),
                CustomAdTextField(
                  controller: biddingStartTimeController,
                  label: 'bidding_start_time'.tr,
                  hint: 'enter_bidding_start_time'.tr,
                  keyboardType: TextInputType.datetime,
                ),
                CustomAdTextField(
                  controller: keywordsController,
                  label: 'keywords'.tr,
                  hint: 'enter_keywords'.tr,
                ),
                CustomAdTextField(
                  controller: descriptionController,
                  label: 'description'.tr,
                  hint: 'enter_description'.tr,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Upload multiple images",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 8, 7, 7)),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImages,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: _selectedImages != null &&
                            _selectedImages!.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _selectedImages!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  File(_selectedImages![index].path),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              );
                            },
                          )
                        : const Center(
                            child:
                                Icon(Icons.add, size: 50, color: Colors.grey),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ActionButton(
                        text: 'create_ad'.tr,
                        onPressed: _submitAd,
                        backgroundColor: const Color(0xff358cde),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
