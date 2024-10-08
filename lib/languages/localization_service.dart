import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Supported languages
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'SA'),
  ];

  // Language codes
  static final langCodes = [
    'en',
    'ar',
  ];

  // Map to hold the loaded translations
  static Map<String, Map<String, String>> translations = {};

  // Load translations from JSON files
  static Future<void> loadTranslations() async {
    for (var i = 0; i < langCodes.length; i++) {
      String langCode = langCodes[i];
      String localeKey = '${langCode}_${locales[i].countryCode}';

      final String jsonString =
          await rootBundle.loadString('assets/translations/$langCode.json');
      Map<String, String> langMap =
          Map<String, String>.from(json.decode(jsonString));
      translations[localeKey] = langMap;
    }
  }

  @override
  Map<String, Map<String, String>> get keys => translations;

  // Get locale from language code
  Locale getLocaleFromLanguageCode(String langCode) {
    for (var locale in locales) {
      if (locale.languageCode == langCode) return locale;
    }
    return locales.first;
  }

  // Change the locale
  void changeLocale(String langCode) {
    final locale = getLocaleFromLanguageCode(langCode);
    Get.updateLocale(locale);
  }
}
