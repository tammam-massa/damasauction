import 'package:damasauction/controllers/ads/ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Make sure to import intl package for DateFormat

class ChooseAdInfoPage extends StatelessWidget {
  ChooseAdInfoPage({super.key});
  final ChooseAdInfoController controller = Get.put(ChooseAdInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button with Text
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left_outlined,
                            color: Colors.black),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'back'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Step Progress Indicator
                  LinearProgressIndicator(
                    minHeight: 10,
                    value: 0.66,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xff358cde),
                  ),
                  const SizedBox(height: 16),

                  // Step Label
                  Text(
                    "step 2".tr,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Form(
                    key: controller.formKey,
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : ListView(
                              shrinkWrap:
                                  true, // To avoid errors related to unbounded height
                              children: [
                                // Dropdown for categories
                                DropdownButtonFormField<String>(
                                  value: controller
                                          .selectedCategory.value.isNotEmpty
                                      ? controller.selectedCategory.value
                                      : null,
                                  decoration: const InputDecoration(
                                      labelText: 'Select Category'),
                                  items: controller.categories.map((category) {
                                    return DropdownMenuItem<String>(
                                      value: category['id'].toString(),
                                      child: Text(category['name']),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    controller.selectedCategory.value = value!;
                                  },
                                ),

                                // Dropdown for city selection
                                DropdownButtonFormField<String>(
                                  value:
                                      controller.selectedCity.value.isNotEmpty
                                          ? controller.selectedCity.value
                                          : null,
                                  items: const [
                                    DropdownMenuItem(
                                        value: '1', child: Text('City 1')),
                                    DropdownMenuItem(
                                        value: '2', child: Text('City 2')),
                                    // Add other cities here
                                  ],
                                  onChanged: (value) {
                                    controller.selectedCity.value = value!;
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Select City'),
                                ),

                                // Name field
                                TextFormField(
                                  controller: controller.nameController,
                                  decoration: const InputDecoration(
                                      labelText: 'Item Name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the item name';
                                    }
                                    return null;
                                  },
                                ),

                                // Starting Price field
                                TextFormField(
                                  controller:
                                      controller.startingPriceController,
                                  decoration: const InputDecoration(
                                      labelText: 'Starting Price'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the starting price';
                                    }
                                    return null;
                                  },
                                ),

                                // Min Increase Price field
                                TextFormField(
                                  controller:
                                      controller.minIncreasePriceController,
                                  decoration: const InputDecoration(
                                      labelText: 'Min Increase Price'),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the minimum increase price';
                                    }
                                    return null;
                                  },
                                ),

                                // Description field
                                TextFormField(
                                  controller: controller.descriptionController,
                                  decoration: const InputDecoration(
                                      labelText: 'Description'),
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a description';
                                    }
                                    return null;
                                  },
                                ),

                                // Keywords field
                                TextFormField(
                                  controller: controller.keywordsController,
                                  decoration: const InputDecoration(
                                      labelText: 'Keywords'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter keywords';
                                    }
                                    return null;
                                  },
                                ),

                                // Bidding Start Time (Date Picker)
                                TextFormField(
                                  controller:
                                      controller.biddingStartTimeController,
                                  decoration: const InputDecoration(
                                      labelText: 'Bidding Start Time'),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );

                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      controller.biddingStartTimeController
                                          .text = formattedDate;
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a bidding start time';
                                    }
                                    return null;
                                  },
                                ),

                                // Attributes field
                                TextFormField(
                                  controller: controller.attributesController,
                                  decoration: const InputDecoration(
                                      labelText:
                                          'Attributes (comma separated)'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the attributes';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 20),

                                ElevatedButton(
                                  onPressed: controller.submitForm,
                                  child: const Text('Submit'),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
