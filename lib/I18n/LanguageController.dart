import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/LanguageModel.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  LanguageController() {
    setLanguage(prefrance.getLanguage());
  }
  Rx<LanguageModel> _selectedLanguage = Languages.english.obs;
  LanguageModel get selectedLanguage => _selectedLanguage.value;
  setLanguage(LanguageModel data) {
    _selectedLanguage(data);
    Get.updateLocale(Locale(data.languagecode, data.countrycode));
    prefrance.setLanguage(data: data);
    _selectedLanguage(data);
  }
}
