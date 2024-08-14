import 'dart:convert';

import 'package:car_booking_owner/Models/LanguageModel.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  late SharedPreferences _prefs;
  Prefs._init();
  static Prefs get instance => Prefs._init();
  setPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static get _languageKey => "Language";
   get userkey => "userkey";
  setLanguage({required LanguageModel data}) {
    _prefs.setString(_languageKey, data.tojson());
  }

  LanguageModel getLanguage() {
    return LanguageModel.fromjson(json: _prefs.getString(_languageKey) ?? "");
  }

  setUserPrefs(Usermodel model) async {
    return await _prefs.setString(userkey, jsonEncode(model.tomap()));
  }

  Usermodel getUserPrefs() {
    return Usermodel.fromjson(
        jsonDecode(_prefs.getString(userkey).toString()));
  }

  removePrefs(String userkey)async {
    return await _prefs.remove(userkey);
  }
}
