import 'package:damasauction/widgets/shared/searchbartop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GovernorateSelectionPage extends StatelessWidget {
  final Function(String) onGovernorateSelected;

  const GovernorateSelectionPage(
      {required this.onGovernorateSelected, super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> governorates = [
      'damascus'.tr,
      'aleppo'.tr,
      'homs'.tr,
      'hama'.tr,
      'lattakia'.tr,
      'tartus'.tr,
      'idlib'.tr,
      'raqqa'.tr,
      'deir_ez_zor'.tr,
      'daraa'.tr,
      'suwayda'.tr,
      'hasakah'.tr,
      'quneitra'.tr,
      'rif_dimashq'.tr,
    ];

    String? selectedGovernorate; // Track the selected governorate

    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf3f3f3),
        title: Center(
          child: Text(
            'select_governorate'.tr, // Title in the middle
            style: const TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black), // Close icon
            onPressed: () {
              Navigator.pop(context); // Close the selection page
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SearchBarTop(
            hint: 'search'.tr,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0), // Rounded top left
                topRight: Radius.circular(20.0), // Rounded top right
              ),
              child: Container(
                color: const Color(0xFFf3f3f3), // Background color
                child: ListView.builder(
                  itemCount: governorates.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle selection when the row is tapped
                        selectedGovernorate = governorates[
                            index]; // Update the selected governorate
                        onGovernorateSelected(selectedGovernorate!);
                        Navigator.pop(context); // Close the selection page
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Customized Radio button
                            Container(
                              width: 20, // Decreased width of the radio button
                              height:
                                  20, // Decreased height of the radio button
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2), // White border
                                color:
                                    selectedGovernorate == governorates[index]
                                        ? Colors.transparent
                                        : Colors.white, // Fill color
                              ),
                              child: Center(
                                child: selectedGovernorate ==
                                        governorates[index]
                                    ? Container(
                                        width:
                                            10, // Decreased inner circle width
                                        height:
                                            10, // Decreased inner circle height
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(
                                              0xff358cde), // Fill color when selected
                                        ),
                                      )
                                    : const SizedBox(), // Empty when not selected
                              ),
                            ),
                            const SizedBox(
                                width:
                                    8), // Spacing between radio button and text
                            Expanded(
                              child: Text(
                                governorates[index],
                                style: const TextStyle(
                                  fontSize: 18, // Increased text size
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
