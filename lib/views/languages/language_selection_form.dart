import 'package:damasauction/views/languages/languagebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For managing saved preferences

class LanguageSelectionForm extends StatefulWidget {
  const LanguageSelectionForm({super.key});

  @override
  LanguageSelectionFormState createState() => LanguageSelectionFormState();
}

class LanguageSelectionFormState extends State<LanguageSelectionForm> {
  String appLanguage = 'arabic';
  String adLanguage = 'both';

  @override
  void initState() {
    super.initState();
    loadSavedPreferences(); // Load preferences when the widget is initialized
  }

  // Load saved language preferences
  void loadSavedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      appLanguage = prefs.getString('appLanguage') ?? 'arabic';
      adLanguage = prefs.getString('adLanguage') ?? 'both';
    });

    // Update the app's language based on the saved preference
    if (appLanguage == 'arabic') {
      Get.updateLocale(const Locale('ar', 'SA')); // Switch to Arabic
    } else {
      Get.updateLocale(const Locale('en', 'US')); // Switch to English
    }
  }

  void changeAppLanguage(String? value) {
    setState(() {
      appLanguage = value!;
      // Switch app's language immediately
      if (appLanguage == 'arabic') {
        Get.updateLocale(
            const Locale('ar', 'SA')); // Update app language to Arabic
      } else {
        Get.updateLocale(
            const Locale('en', 'US')); // Update app language to English
      }
    });
  }

  void _saveAndGoToMore() async {
    // Save the language preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appLanguage', appLanguage);
    prefs.setString('adLanguage', adLanguage);

    // Navigate back to the "More" section
    Get.back(); // Assuming "More" is the previous screen
  }

  @override
  Widget build(BuildContext context) {
    // Determine text direction based on the selected language
    bool isArabic = appLanguage == 'arabic';

    return Directionality(
      textDirection: isArabic
          ? TextDirection.rtl
          : TextDirection.ltr, // Set RTL for Arabic
      child: Container(
        color: const Color(0xFFf3f3f3), // Set background color here
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Language Selection
              Text(
                'please_choose_the_app_language'.tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  LanguageButton(
                    title: 'العربية',
                    value: 'arabic',
                    groupValue: appLanguage,
                    onChanged: changeAppLanguage,
                  ),
                  const SizedBox(width: 12),
                  LanguageButton(
                    title: 'English',
                    value: 'english',
                    groupValue: appLanguage,
                    onChanged: changeAppLanguage,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Ad Language Selection
              Text(
                'please_choose_the_advert_language'.tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  LanguageButton(
                    title: 'arabic'.tr,
                    value: 'arabic',
                    groupValue: adLanguage,
                    onChanged: (value) {
                      setState(() {
                        adLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  LanguageButton(
                    title: 'english'.tr,
                    value: 'english',
                    groupValue: adLanguage,
                    onChanged: (value) {
                      setState(() {
                        adLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  LanguageButton(
                    title: 'both'.tr,
                    value: 'both',
                    groupValue: adLanguage,
                    onChanged: (value) {
                      setState(() {
                        adLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  'you_can_change_the_language_anytime'.tr,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff358cde), // Button color
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed:
                      _saveAndGoToMore, // Call the save and go back method
                  child: Text(
                    'save_and_back_to_more'.tr,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
