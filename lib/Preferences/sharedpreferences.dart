import 'package:car_booking_owner/Models/LanguageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  late SharedPreferences _prefs;
  Prefs._init();
  static Prefs get instance => Prefs._init();
  setPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static get _languageKey => "Language";
  setLanguage({required LanguageModel data}) {
    _prefs.setString(_languageKey, data.tojson());
  }

  LanguageModel getLanguage() {
    return LanguageModel.fromjson(json: _prefs.getString(_languageKey) ?? "");
  }
}
