import 'package:damasauction/controllers/category/category_controller.dart';
import 'package:damasauction/views/ads/choose_ads_image_step3.dart';
import 'package:damasauction/widgets/ads/custom_ad_dropdownlist.dart';
import 'package:damasauction/widgets/ads/custom_ad_text.dart';
import 'package:damasauction/widgets/shared/actionbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseAdsInfoPage extends StatefulWidget {
  const ChooseAdsInfoPage({super.key});

  @override
  ChooseAdsInfoPageState createState() => ChooseAdsInfoPageState();
}

class ChooseAdsInfoPageState extends State<ChooseAdsInfoPage>
    with SingleTickerProviderStateMixin {
  final CategoryController categoryController = Get.put(CategoryController());
  late Future<void> _fetchData;
  final Map<int, String?> selectedOptions = {}; // For dropdown values
  final Map<int, TextEditingController> textControllers =
      {}; // For text input fields
  final TextEditingController itemNameController = TextEditingController();

  // City selection logic (unchanged)
  final List<Map<String, dynamic>> cities = [
    {'name': 'damascus'.tr, 'id': 1},
    {'name': 'aleppo'.tr, 'id': 2},
    {'name': 'homs'.tr, 'id': 3},
    {'name': 'latakia'.tr, 'id': 4},
    {'name': 'tartus'.tr, 'id': 5},
  ];
  int? selectedCityId;
  String? selectedCity;

  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    final int? categoryId = Get.arguments['categoryId'];
    if (categoryId != null) {
      _fetchData = categoryController.fetchCategoryDetails(categoryId);
    } else {
      _fetchData = Future.error('category_ID_not_provided.'.tr);
    }

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.33, end: 0.66).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    itemNameController.dispose();
    for (var controller in textControllers.values) {
      controller.dispose(); // Dispose text controllers
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf3f3f3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text('back'.tr,
            style: const TextStyle(fontSize: 16, color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated progress bar
              AnimatedBuilder(
                animation: _animationController!,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    minHeight: 10,
                    value: _animation?.value,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xff358cde),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Text("step 2".tr,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<void>(
                  future: _fetchData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('error: ${snapshot.error}'.tr));
                    }

                    return Obx(() {
                      if (categoryController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (categoryController
                          .categoryModel.value.attributes.isEmpty) {
                        return Center(
                          child:
                              Text('no_attributes_found_for_this_category.'.tr),
                        );
                      } else {
                        return ListView(
                          children: [
                            // City Dropdown
                            CustomAdDropdown(
                              label: 'city'.tr,
                              hint: 'choose_city'.tr,
                              items: cities
                                  .map((city) => city['name'] as String)
                                  .toList(),
                              value: selectedCity,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCity = newValue;
                                  selectedCityId = cities.firstWhere((city) =>
                                      city['name'] == newValue)['id'] as int;
                                });
                              },
                            ),

                            // Attributes logic for dropdown or text input
                            ...categoryController.categoryModel.value.attributes
                                .map((attribute) {
                              var options = attribute.attributeTypeList
                                  .map((option) => option.option)
                                  .toList();

                              if (options.isNotEmpty) {
                                // Dropdown attribute
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomAdDropdown(
                                        label: attribute.attributeName,
                                        hint: 'choose'.tr +
                                            ' ' +
                                            attribute.attributeName.tr,
                                        items: options,
                                        value: selectedOptions[
                                            attribute.attributeId],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedOptions[attribute
                                                .attributeId] = newValue;
                                          });
                                        },
                                      ),
                                      // Validation message
                                      if (selectedOptions[
                                              attribute.attributeId] ==
                                          null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Please select an option for ${attribute.attributeName}.',
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              } else {
                                // Text input attribute
                                if (!textControllers
                                    .containsKey(attribute.attributeId)) {
                                  textControllers[attribute.attributeId] =
                                      TextEditingController();
                                }

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: CustomAdTextField(
                                    controller:
                                        textControllers[attribute.attributeId]!,
                                    label: attribute.attributeName,
                                    hint: 'enter'.tr +
                                        ' ' +
                                        attribute.attributeName.tr,
                                    keyboardType: TextInputType.text,
                                  ),
                                );
                              }
                            }).toList(),

                            // Item Name
                            CustomAdTextField(
                              controller: itemNameController,
                              label: 'item_name'.tr,
                              hint: 'enter_item_name'.tr,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        );
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ActionButton(
                  text: 'next'.tr,
                  onPressed: () {
                    bool allSelected = true;

                    if (selectedCityId == null) {
                      allSelected = false;
                    }

                    for (var option in selectedOptions.values) {
                      if (option == null) {
                        allSelected = false;
                        break;
                      }
                    }

                    for (var controller in textControllers.values) {
                      if (controller.text.isEmpty) {
                        allSelected = false;
                        break;
                      }
                    }

                    if (!allSelected) {
                      Get.snackbar(
                        'Error',
                        'Please select all required fields.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      final int? categoryId = Get.arguments['categoryId'];
                      Get.to(
                        ChooseAdsImagePage(),
                        arguments: {
                          'categoryId': categoryId,
                          'cityId': selectedCityId,
                          'attributes': {
                            ...selectedOptions,
                            ...textControllers.map((key, controller) =>
                                MapEntry(key, controller.text)),
                          },
                          'itemName': itemNameController.text,
                        },
                      );
                    }
                  },
                  backgroundColor: const Color(0xff358cde),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
