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
