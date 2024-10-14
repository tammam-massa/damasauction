import 'dart:io';
import 'package:damasauction/models/attribute/attribute.dart';
import 'package:damasauction/services/services.dart';
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
  MyServices myServices = Get.find();

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

  // Future<void> _submitAd() async {
  //   setState(() {
  //     _isLoading = true; // Show loading indicator
  //   });

  //   final Uri apiUrl =
  //       Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

  //   // Ensure images are selected
  //   if (_selectedImages == null || _selectedImages!.isEmpty) {
  //     print('No images selected.');
  //     Get.snackbar('Error', 'Please select at least one image.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if no images
  //     });
  //     return;
  //   }

  //   // Validate city ID
  //   final String cityId = Get.arguments['cityId'].toString();
  //   List<String> validCityIds = ['1', '2', '3'];

  //   if (!validCityIds.contains(cityId)) {
  //     print('Invalid city ID selected: $cityId');
  //     Get.snackbar('Error', 'Invalid city ID selected.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if invalid city ID
  //     });
  //     return;
  //   }

  //   try {
  //     // Check if description is empty
  //     if (descriptionController.text.isEmpty) {
  //       print('Description is empty');
  //       Get.snackbar('Error', 'Please provide a description.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Get attributes and format them correctly
  //     final attributes = Get.arguments['attributes'];
  //     List<Map<String, dynamic>> attributeList = [];

  //     if (attributes is Map) {
  //       attributeList = attributes.entries
  //           .map((entry) => {'key': entry.key, 'value': entry.value})
  //           .toList();
  //       print('Attributes (Map): $attributeList');
  //     } else if (attributes is List) {
  //       attributeList = List<Map<String, dynamic>>.from(attributes);
  //       print('Attributes (List): $attributeList');
  //     } else {
  //       print('Invalid attributes format.');
  //       Get.snackbar('Error', 'Invalid attributes format.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Fetch the token
  //     final token = await getToken();

  //     if (token == null) {
  //       print('No access token found');
  //       Get.snackbar('Error', 'No access token found. Please log in.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     print('Token: Bearer $token');

  //     // Create a MultipartRequest
  //     final request = http.MultipartRequest('POST', apiUrl)
  //       ..fields['category_id'] = Get.arguments['categoryId'].toString()
  //       ..fields['city_id'] = cityId
  //       ..fields['starting_price'] = startingPriceController.text
  //       ..fields['min_increase_price'] = minIncreasePriceController.text
  //       ..fields['description'] = descriptionController.text
  //       ..fields['keywords'] = keywordsController.text
  //       ..fields['bidding_start_time'] = biddingStartTimeController.text
  //       ..fields['name'] = Get.arguments['itemName']
  //       ..headers['Authorization'] = 'Bearer $token'; // Use token dynamically

  //     // Correctly encode attributes
  //     request.fields['attributes'] = jsonEncode(attributeList);

  //     // Add selected images as 'photos'
  //     for (var image in _selectedImages!) {
  //       var stream = http.ByteStream(image.openRead());
  //       var length = await image.length();
  //       var multipartFile = http.MultipartFile(
  //         'photos[]', // Field name for images
  //         stream,
  //         length,
  //         filename: basename(image.path),
  //       );
  //       request.files.add(multipartFile);
  //     }

  //     print('Sending request to: $apiUrl');
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseBody = await response.stream.bytesToString();
  //       final responseData = json.decode(responseBody);
  //       print('Response Body: $responseBody');

  //       if (responseData['success']) {
  //         print('Ad submitted successfully: ${responseData['message']}');
  //         Get.to(
  //           const AdsSuccessPage(),
  //           arguments: {
  //             'categoryId': Get.arguments['categoryId'],
  //             'cityId': Get.arguments['cityId'],
  //             'attributes': Get.arguments['attributes'],
  //             'itemName': Get.arguments['itemName'],
  //           },
  //         );
  //       } else {
  //         print('Error: ${responseData['message'] ?? 'Unknown error'}');
  //         Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
  //       }
  //     } else {
  //       final responseBody = await response.stream.bytesToString();
  //       print(
  //           'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //       Get.snackbar('Error',
  //           'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false; // Stop loading
  //     });
  //   }
  // }
  // Future<void> _submitAd() async {
  //   setState(() {
  //     _isLoading = true; // Show loading indicator
  //   });

  //   final Uri apiUrl =
  //       Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

  //   // Ensure images are selected
  //   if (_selectedImages == null || _selectedImages!.isEmpty) {
  //     print('No images selected.');
  //     Get.snackbar('Error', 'Please select at least one image.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if no images
  //     });
  //     return;
  //   }

  //   // Validate city ID
  //   final String cityId = Get.arguments['cityId'].toString();
  //   List<String> validCityIds = ['1', '2', '3'];

  //   if (!validCityIds.contains(cityId)) {
  //     print('Invalid city ID selected: $cityId');
  //     Get.snackbar('Error', 'Invalid city ID selected.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if invalid city ID
  //     });
  //     return;
  //   }

  //   try {
  //     // Check if description is empty
  //     if (descriptionController.text.isEmpty) {
  //       print('Description is empty');
  //       Get.snackbar('Error', 'Please provide a description.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Get attributes and ensure they are of type List<Map<String, dynamic>>
  //     final attributesArg = Get.arguments['attributes'];

  //     List<Map<String, dynamic>> attributes;
  //     if (attributesArg is List<Attribute>) {
  //       // If it's already a List<Attribute>, map it directly
  //       attributes = attributesArg.map((attr) {
  //         return {
  //           'key': attr.attributeId,
  //           'value': attr.attributeName,
  //         };
  //       }).toList();
  //     } else if (attributesArg is Map) {
  //       // Convert Map to List<Map<String, dynamic>>
  //       attributes = attributesArg.entries.map((entry) {
  //         final attributeId = entry.key;
  //         final attributeName = entry.value ?? '';
  //         return {
  //           'key': attributeId,
  //           'value': attributeName,
  //         };
  //       }).toList();
  //     } else {
  //       print('Invalid attributes format: ${attributesArg.runtimeType}');
  //       Get.snackbar('Error', 'Invalid attributes format.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Print attributes to check format
  //     print('Attributes: ${jsonEncode(attributes)}');

  //     // Fetch the token
  //     final token = await getToken();

  //     if (token == null) {
  //       print('No access token found');
  //       Get.snackbar('Error', 'No access token found. Please log in.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     print('Token: Bearer $token');

  //     // Create a MultipartRequest
  //     final request = http.MultipartRequest('POST', apiUrl)
  //       ..fields['category_id'] = Get.arguments['categoryId'].toString()
  //       ..fields['city_id'] = cityId
  //       ..fields['starting_price'] = startingPriceController.text
  //       ..fields['min_increase_price'] = minIncreasePriceController.text
  //       ..fields['description'] = descriptionController.text
  //       ..fields['keywords'] = keywordsController.text
  //       ..fields['bidding_start_time'] = biddingStartTimeController.text
  //       ..fields['name'] = Get.arguments['itemName']
  //       ..headers['Authorization'] = 'Bearer $token'; // Use token dynamically

  //     // Correctly encode attributes as a JSON array
  //     request.fields['attributes'] = jsonEncode(attributes);

  //     // Add selected images as 'photos'
  //     for (var image in _selectedImages!) {
  //       var stream = http.ByteStream(image.openRead());
  //       var length = await image.length();
  //       var multipartFile = http.MultipartFile(
  //         'photos[]', // Field name for images
  //         stream,
  //         length,
  //         filename: basename(image.path),
  //       );
  //       request.files.add(multipartFile);
  //     }

  //     print('Sending request to: $apiUrl');
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseBody = await response.stream.bytesToString();
  //       final responseData = json.decode(responseBody);
  //       print('Response Body: $responseBody');

  //       if (responseData['success']) {
  //         print('Ad submitted successfully: ${responseData['message']}');
  //         Get.to(
  //           const AdsSuccessPage(),
  //           arguments: {
  //             'categoryId': Get.arguments['categoryId'],
  //             'cityId': Get.arguments['cityId'],
  //             'attributes': Get.arguments['attributes'],
  //             'itemName': Get.arguments['itemName'],
  //           },
  //         );
  //       } else {
  //         print('Error: ${responseData['message'] ?? 'Unknown error'}');
  //         Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
  //       }
  //     } else {
  //       final responseBody = await response.stream.bytesToString();
  //       print(
  //           'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //       Get.snackbar('Error',
  //           'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false; // Stop loading
  //     });
  //   }
  // }
  // Future<void> _submitAd() async {
  //   setState(() {
  //     _isLoading = true; // Show loading indicator
  //   });

  //   final Uri apiUrl =
  //       Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

  //   // Ensure images are selected
  //   if (_selectedImages == null || _selectedImages!.isEmpty) {
  //     print('No images selected.');
  //     Get.snackbar('Error', 'Please select at least one image.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if no images
  //     });
  //     return;
  //   }

  //   // Validate city ID
  //   final String cityId = Get.arguments['cityId'].toString();
  //   List<String> validCityIds = ['1', '2', '3'];

  //   if (!validCityIds.contains(cityId)) {
  //     print('Invalid city ID selected: $cityId');
  //     Get.snackbar('Error', 'Invalid city ID selected.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if invalid city ID
  //     });
  //     return;
  //   }

  //   try {
  //     // Check if description is empty
  //     if (descriptionController.text.isEmpty) {
  //       print('Description is empty');
  //       Get.snackbar('Error', 'Please provide a description.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Get attributes and ensure they are of type List<Map<String, dynamic>>
  //     final attributesArg = Get.arguments['attributes'];

  //     List<Map<String, dynamic>> attributes;
  //     if (attributesArg is List<Attribute>) {
  //       // If it's already a List<Attribute>, map it directly
  //       attributes = attributesArg.map((attr) {
  //         return {
  //           'key': attr.attributeId.toString(),
  //           'value': attr.attributeName,
  //         };
  //       }).toList();
  //     } else if (attributesArg is Map) {
  //       // Convert Map to List<Map<String, dynamic>>
  //       attributes = attributesArg.entries.map((entry) {
  //         final attributeId = entry.key.toString();
  //         final attributeName = entry.value ?? '';
  //         return {
  //           'key': attributeId,
  //           'value': attributeName,
  //         };
  //       }).toList();
  //     } else {
  //       print('Invalid attributes format: ${attributesArg.runtimeType}');
  //       Get.snackbar('Error', 'Invalid attributes format.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Print attributes to check format
  //     print('Attributes: ${jsonEncode(attributes)}');

  //     // Fetch the token
  //     final token = await getToken();

  //     if (token == null) {
  //       print('No access token found');
  //       Get.snackbar('Error', 'No access token found. Please log in.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     print('Token: Bearer $token');

  //     // Create a MultipartRequest
  //     final request = http.MultipartRequest('POST', apiUrl)
  //       ..fields['category_id'] = Get.arguments['categoryId'].toString()
  //       ..fields['city_id'] = cityId
  //       ..fields['starting_price'] = startingPriceController.text
  //       ..fields['min_increase_price'] = minIncreasePriceController.text
  //       ..fields['description'] = descriptionController.text
  //       ..fields['keywords'] = keywordsController.text
  //       ..fields['bidding_start_time'] = biddingStartTimeController.text
  //       ..fields['name'] = Get.arguments['itemName']
  //       ..headers['Authorization'] = 'Bearer $token'; // Use token dynamically

  //     // Correctly encode attributes as a JSON array of objects
  //     request.fields['attributes'] = jsonEncode(attributes);

  //     // Add selected images as 'photos'
  //     for (var image in _selectedImages!) {
  //       var stream = http.ByteStream(image.openRead());
  //       var length = await image.length();
  //       var multipartFile = http.MultipartFile(
  //         'photos[]', // Field name for images
  //         stream,
  //         length,
  //         filename: basename(image.path),
  //       );
  //       request.files.add(multipartFile);
  //     }

  //     print('Sending request to: $apiUrl');
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseBody = await response.stream.bytesToString();
  //       final responseData = json.decode(responseBody);
  //       print('Response Body: $responseBody');

  //       if (responseData['success']) {
  //         print('Ad submitted successfully: ${responseData['message']}');
  //         Get.to(
  //           const AdsSuccessPage(),
  //           arguments: {
  //             'categoryId': Get.arguments['categoryId'],
  //             'cityId': Get.arguments['cityId'],
  //             'attributes': Get.arguments['attributes'],
  //             'itemName': Get.arguments['itemName'],
  //           },
  //         );
  //       } else {
  //         print('Error: ${responseData['message'] ?? 'Unknown error'}');
  //         Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
  //       }
  //     } else {
  //       final responseBody = await response.stream.bytesToString();
  //       print(
  //           'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //       Get.snackbar('Error',
  //           'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false; // Stop loading
  //     });
  //   }
  // }

  // Future<void> _submitAd() async {
  //   setState(() {
  //     _isLoading = true; // Show loading indicator
  //   });

  //   final Uri apiUrl =
  //       Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

  //   // Ensure images are selected
  //   if (_selectedImages == null || _selectedImages!.isEmpty) {
  //     print('No images selected.');
  //     Get.snackbar('Error', 'Please select at least one image.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if no images
  //     });
  //     return;
  //   }

  //   // Validate city ID
  //   final String cityId = Get.arguments['cityId'].toString();
  //   List<String> validCityIds = ['1', '2', '3'];

  //   if (!validCityIds.contains(cityId)) {
  //     print('Invalid city ID selected: $cityId');
  //     Get.snackbar('Error', 'Invalid city ID selected.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if invalid city ID
  //     });
  //     return;
  //   }

  //   try {
  //     // Check if description is empty
  //     if (descriptionController.text.isEmpty) {
  //       print('Description is empty');
  //       Get.snackbar('Error', 'Please provide a description.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Get attributes and ensure they are in correct format
  //     final attributesArg = Get.arguments['attributes'];

  //     // Prepare the attributes as attributes[0][attribute_id], attributes[0][value] style
  //     Map<String, String> attributesFields = {};
  //     if (attributesArg is List<Attribute>) {
  //       for (var i = 0; i < attributesArg.length; i++) {
  //         attributesFields['attributes[$i][key]'] =
  //             attributesArg[i].attributeId.toString();
  //         attributesFields['attributes[$i][value]'] =
  //             attributesArg[i].attributeName;
  //       }
  //     } else if (attributesArg is Map) {
  //       int i = 0;
  //       attributesArg.forEach((attributeId, attributeName) {
  //         attributesFields['attributes[$i][key]'] = attributeId.toString();
  //         attributesFields['attributes[$i][value]'] = attributeName;
  //         i++;
  //       });
  //     } else {
  //       print('Invalid attributes format: ${attributesArg.runtimeType}');
  //       Get.snackbar('Error', 'Invalid attributes format.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Fetch the token
  //     final token = await getToken();

  //     if (token == null) {
  //       print('No access token found');
  //       Get.snackbar('Error', 'No access token found. Please log in.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     print('Token: Bearer $token');

  //     // Create a MultipartRequest
  //     final request = http.MultipartRequest('POST', apiUrl)
  //       ..headers['Authorization'] = 'Bearer $token'
  //       ..fields['category_id'] = Get.arguments['categoryId'].toString()
  //       ..fields['city_id'] = cityId
  //       ..fields['starting_price'] = startingPriceController.text
  //       ..fields['min_increase_price'] = minIncreasePriceController.text
  //       ..fields['description'] = descriptionController.text
  //       ..fields['keywords'] = keywordsController.text
  //       ..fields['bidding_start_time'] = biddingStartTimeController.text
  //       ..fields['name'] = Get.arguments['itemName'];

  //     // Add attributes to fields
  //     attributesFields.forEach((key, value) {
  //       request.fields[key] = value;
  //     });

  //     // Add selected images as 'photos'
  //     for (var image in _selectedImages!) {
  //       var stream = http.ByteStream(image.openRead());
  //       var length = await image.length();
  //       var multipartFile = http.MultipartFile(
  //         'photos[]', // Field name for images
  //         stream,
  //         length,
  //         filename: basename(image.path),
  //       );
  //       request.files.add(multipartFile);
  //     }

  //     print('Sending request to: $apiUrl');
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseBody = await response.stream.bytesToString();
  //       final responseData = json.decode(responseBody);
  //       print('Response Body: $responseBody');

  //       if (responseData['success']) {
  //         print('Ad submitted successfully: ${responseData['message']}');
  //         Get.to(
  //           const AdsSuccessPage(),
  //           arguments: {
  //             'categoryId': Get.arguments['categoryId'],
  //             'cityId': Get.arguments['cityId'],
  //             'attributes': Get.arguments['attributes'],
  //             'itemName': Get.arguments['itemName'],
  //           },
  //         );
  //       } else {
  //         print('Error: ${responseData['message'] ?? 'Unknown error'}');
  //         Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
  //       }
  //     } else {
  //       final responseBody = await response.stream.bytesToString();
  //       print(
  //           'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //       Get.snackbar('Error',
  //           'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false; // Stop loading
  //     });
  //   }
  // }

  // Future<void> _submitAd() async {
  //   setState(() {
  //     _isLoading = true; // Show loading indicator
  //   });

  //   final Uri apiUrl =
  //       Uri.parse('https://api.mazaddimashq.com/api/item/create-item');

  //   // Ensure images are selected
  //   if (_selectedImages == null || _selectedImages!.isEmpty) {
  //     print('No images selected.');
  //     Get.snackbar('Error', 'Please select at least one image.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if no images
  //     });
  //     return;
  //   }

  //   // Validate city ID
  //   final String cityId = Get.arguments['cityId'].toString();
  //   List<String> validCityIds = ['1', '2', '3'];

  //   if (!validCityIds.contains(cityId)) {
  //     print('Invalid city ID selected: $cityId');
  //     Get.snackbar('Error', 'Invalid city ID selected.');
  //     setState(() {
  //       _isLoading = false; // Stop loading if invalid city ID
  //     });
  //     return;
  //   }

  //   try {
  //     // Check if description is empty
  //     if (descriptionController.text.isEmpty) {
  //       print('Description is empty');
  //       Get.snackbar('Error', 'Please provide a description.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Get attributes and ensure they are of type List<Map<String, dynamic>>
  //     final attributesArg = Get.arguments['attributes'];

  //     List<Map<String, dynamic>> attributes;
  //     if (attributesArg is List<Attribute>) {
  //       // If it's already a List<Attribute>, map it directly
  //       attributes = attributesArg.map((attr) {
  //         return {
  //           'attribute_id': attr.attributeId.toString(),
  //           'value': attr.attributeName,
  //         };
  //       }).toList();
  //     } else if (attributesArg is Map) {
  //       // Convert Map to List<Map<String, dynamic>>
  //       attributes = attributesArg.entries.map((entry) {
  //         final attributeId = entry.key.toString();
  //         final attributeName = entry.value ?? '';
  //         return {
  //           'attribute_id': attributeId,
  //           'value': attributeName,
  //         };
  //       }).toList();
  //     } else {
  //       print('Invalid attributes format: ${attributesArg.runtimeType}');
  //       Get.snackbar('Error', 'Invalid attributes format.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     // Print attributes to check format
  //     print('Attributes to send: ${jsonEncode(attributes)}');

  //     // Fetch the token
  //     final token = await getToken();

  //     if (token == null) {
  //       print('No access token found');
  //       Get.snackbar('Error', 'No access token found. Please log in.');
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return;
  //     }

  //     print('Token: Bearer $token');

  //     // Create a MultipartRequest
  //     final request = http.MultipartRequest('POST', apiUrl)
  //       ..fields['category_id'] = Get.arguments['categoryId'].toString()
  //       ..fields['city_id'] = cityId
  //       ..fields['starting_price'] = startingPriceController.text
  //       ..fields['min_increase_price'] = minIncreasePriceController.text
  //       ..fields['description'] = descriptionController.text
  //       ..fields['keywords'] = keywordsController.text
  //       ..fields['bidding_start_time'] = biddingStartTimeController.text
  //       ..fields['name'] = Get.arguments['itemName']
  //       ..headers['Authorization'] = 'Bearer $token'; // Use token dynamically

  //     // Correctly encode attributes as a raw JSON array
  //     request.fields['attributes'] = jsonEncode(attributes);

  //     // Add selected images as 'photos'
  //     for (var image in _selectedImages!) {
  //       var stream = http.ByteStream(image.openRead());
  //       var length = await image.length();
  //       var multipartFile = http.MultipartFile(
  //         'photos[]', // Field name for images
  //         stream,
  //         length,
  //         filename: basename(image.path),
  //       );
  //       request.files.add(multipartFile);
  //     }

  //     print('Sending request to: $apiUrl');
  //     final response = await request.send();

  //     if (response.statusCode == 200) {
  //       final responseBody = await response.stream.bytesToString();
  //       final responseData = json.decode(responseBody);
  //       print('Response Body: $responseBody');

  //       if (responseData['success']) {
  //         print('Ad submitted successfully: ${responseData['message']}');
  //         Get.to(
  //           const AdsSuccessPage(),
  //           arguments: {
  //             'categoryId': Get.arguments['categoryId'],
  //             'cityId': Get.arguments['cityId'],
  //             'attributes': Get.arguments['attributes'],
  //             'itemName': Get.arguments['itemName'],
  //           },
  //         );
  //       } else {
  //         print('Error: ${responseData['message'] ?? 'Unknown error'}');
  //         Get.snackbar('Error', responseData['message'] ?? 'Unknown error');
  //       }
  //     } else {
  //       final responseBody = await response.stream.bytesToString();
  //       print(
  //           'Error: Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //       Get.snackbar('Error',
  //           'Failed to upload ad. Status: ${response.statusCode}, Body: $responseBody');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     setState(() {
  //       _isLoading = false; // Stop loading
  //     });
  //   }
  // }
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
    final String cityId = Get.arguments['cityId'].toString();
    List<String> validCityIds = ['1', '2', '3'];

    if (!validCityIds.contains(cityId)) {
      print('Invalid city ID selected: $cityId');
      Get.snackbar('Error', 'Invalid city ID selected.');
      setState(() {
        _isLoading = false; // Stop loading if invalid city ID
      });
      return;
    }

    try {
      // Check if description is empty
      if (descriptionController.text.isEmpty) {
        print('Description is empty');
        Get.snackbar('Error', 'Please provide a description.');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Get attributes and ensure they are of type List<Map<String, dynamic>>
      final attributesArg = Get.arguments['attributes'];

      List<Map<String, dynamic>> attributes = [];

      if (attributesArg is Map) {
        // Convert Map to List<Map<String, dynamic>>
        attributes = attributesArg.entries.map((entry) {
          return {
            'attribute_id': entry.key.toString(),
            'value': entry.value ?? '',
          };
        }).toList();
      } else {
        print('Invalid attributes format: ${attributesArg.runtimeType}');
        Get.snackbar('Error', 'Invalid attributes format.');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Print attributes to check format
      print('Attributes to send: ${jsonEncode(attributes)}');

      // Fetch the token
      final token = await getToken();

      if (token == null) {
        print('No access token found');
        Get.snackbar('Error', 'No access token found. Please log in.');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      print('Token: Bearer $token');

      // Create a MultipartRequest
      final request = http.MultipartRequest('POST', apiUrl)
        ..fields['category_id'] = Get.arguments['categoryId'].toString()
        ..fields['city_id'] = cityId
        ..fields['starting_price'] = startingPriceController.text
        ..fields['min_increase_price'] = minIncreasePriceController.text
        ..fields['description'] = descriptionController.text
        ..fields['keywords'] = keywordsController.text
        ..fields['bidding_start_time'] = biddingStartTimeController.text
        ..fields['name'] = Get.arguments['itemName']
        ..headers['Authorization'] = 'Bearer $token'; // Use token dynamically

      // Correctly encode attributes as form fields instead of JSON array
      attributes.forEach((attr) {
        request.fields['attributes[${attr['attribute_id']}][attribute_id]'] =
            attr['attribute_id'];
        request.fields['attributes[${attr['attribute_id']}][value]'] =
            attr['value'];
      });

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

      print('Sending request to: $apiUrl');
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseData = json.decode(responseBody);
        print('Response Body: $responseBody');

        if (responseData['success']) {
          print('Ad submitted successfully: ${responseData['message']}');
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
          print('Error: ${responseData['message'] ?? 'Unknown error'}');
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
      print('Error occurred: $e');
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
                  controller: descriptionController,
                  label: 'description'.tr,
                  hint: 'enter_description'.tr,
                  keyboardType: TextInputType.multiline,
                ),
                CustomAdTextField(
                  controller: keywordsController,
                  label: 'keywords'.tr,
                  hint: 'enter_keywords'.tr,
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                _selectedImages != null && _selectedImages!.isNotEmpty
                    ? Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: _selectedImages!.map((image) {
                          return Image.file(
                            File(image.path),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                      )
                    : const Text('No images selected'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickImages,
                  child: Text('choose_images'.tr),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ActionButton(
                    onPressed: _submitAd,
                    //  isLoading: _isLoading,
                    text: 'create_ad'.tr,
                    backgroundColor: const Color(
                        0xff358cde), // Show loading indicator if needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> getToken() async {
    return myServices.sharedPreferences.getString("access_token");
  }
}
