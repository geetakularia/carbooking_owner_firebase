// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LanguageModel {
  final String languagename;
  final String languagecode;
  final String countrycode;
  LanguageModel(
      {required this.countrycode,
      required this.languagecode,
      required this.languagename});
  factory LanguageModel.fromjson({required String json}) {
    final Map<String, dynamic> data =
        json.isEmpty ? <String, dynamic>{} : jsonDecode(json);
    return LanguageModel(
        countrycode: data["name"] ?? "English",
        languagecode: data["language_code"] ?? "en",
        languagename: data["country_code"] ?? "US");
  }
  String tojson() => jsonEncode({
        "name": languagename,
        "language_code": languagecode,
        "country_code": countrycode
      });

  @override
  String toString() => "${languagecode}_$countrycode";

  @override
  bool operator ==(covariant LanguageModel other) {
    if (identical(this, other)) return true;

    return other.languagename == languagename &&
        other.languagecode == languagecode &&
        other.countrycode == countrycode;
  }

  @override
  int get hashCode =>
      languagename.hashCode ^ languagecode.hashCode ^ countrycode.hashCode;
}
