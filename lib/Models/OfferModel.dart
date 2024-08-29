// ignore_for_file: public_member_api_docs, sort_constructors_first
class OfferModel {
  String? id;
  String? title;
  String? couponcode;
  String? description;
  OfferModel({
    this.id,
    this.title,
    this.couponcode,
    this.description,
  });
  OfferModel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        title = json["title"] ?? "",
        couponcode = json["couponcode"] ?? "",
        description = json["description"] ?? "";
  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "title": title,
      "couponcode": couponcode,
      "description": description
    };
  }

  OfferModel copywith(
      {String? id, String? title, String? couponcode, String? description}) {
    return OfferModel(
        title: title ?? this.title,
        couponcode: couponcode ?? this.couponcode,
        description: description ?? this.description,
        id: id ?? this.id);
  }
}
