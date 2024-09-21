// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class OfferModel {
//   String? id;
//   String? title;
//   String? couponcode;
//   String? description;
//   OfferModel({
//     this.id,
//     this.title,
//     this.couponcode,
//     this.description,
//   });
//   OfferModel.fromjson(Map<String, dynamic> json)
//       : id = json["id"] ?? "",
//         title = json["title"] ?? "",
//         couponcode = json["couponcode"] ?? "",
//         description = json["description"] ?? "";

//   Map<String, dynamic> tojson() {
//     return {
//       "id": id,
//       "title": title,
//       "couponcode": couponcode,
//       "description": description
//     };
//   }

//   OfferModel copywith(
//       {String? id, String? title, String? couponcode, String? description}) {
//     return OfferModel(
//         title: title ?? this.title,
//         couponcode: couponcode ?? this.couponcode,
//         description: description ?? this.description,
//         id: id ?? this.id);
//   }
// }

import 'package:car_booking_owner/Models/carmodel.dart';

// enum DiscountType {
//   firstTimeCustomer,
//   tiered,
//   bundle,
// }

// Main model class
class OfferDetails {
  String? OfferId;
  int? generalDiscount;
  String? bannerimg;
  String? title;
  String? couponCode;
  String? description;
  int? totalUsers;
  int? usesPerCustomer;
  String? discountType;
  List<TieredDiscount>? tieredDiscounts;
  List<Benefitsmodel>? benefitsmodel;
  String? bundleType; // Only for Bundle Discount

  OfferDetails(
      {this.discountType,
      this.OfferId,
      this.generalDiscount,
      this.bannerimg,
      this.title,
      this.couponCode,
      this.description,
      this.totalUsers,
      this.usesPerCustomer,
      this.tieredDiscounts,
      this.bundleType,
      this.benefitsmodel});

  OfferDetails.fromofferdetails(FirebaseResponseModel json)
      : OfferId = json.docid,
        generalDiscount = json.data['generalDiscount'] ?? 0.0,
        bannerimg = json.data['bannerimg'] ?? '',
        title = json.data['title'] ?? '',
        couponCode = json.data['couponCode'] ?? '',
        description = json.data['description'] ?? '',
        totalUsers = json.data['totalUsers'] ?? 0,
        usesPerCustomer = json.data['usesPerCustomer'] ?? 0,
        discountType = json.data["discountType"],
        tieredDiscounts = json.data["tieredDiscounts"] != null
            ? (json.data["tieredDiscounts"] as List)
                .map(
                  (e) => TieredDiscount.fromJson(e),
                )
                .toList()
            : null,
        benefitsmodel = json.data["benefitsmodel"] != null
            ? (json.data["benefitsmodel"] as List)
                .map(
                  (e) => Benefitsmodel.frombenefit(e),
                )
                .toList()
            : null,
        bundleType = json.data['bundleType'] ?? '';

  // Method to convert OfferDetails to JSON
  Map<String, dynamic> toJson() {
    return {
      'OfferId': OfferId,
      'generalDiscount': generalDiscount,
      'bannerimg': bannerimg,
      'title': title,
      'couponCode': couponCode,
      'description': description,
      'totalUsers': totalUsers,
      'usesPerCustomer': usesPerCustomer,
      'discountType': discountType,
      'tieredDiscounts': tieredDiscounts?.map((e) => e.toJson()).toList() ?? [],
      'benefitsmodel': benefitsmodel?.map((e) => e.toMap()).toList() ?? [],
      'bundleType': bundleType,
    };
  }

  OfferDetails copyWith({
    String? OfferId,
    int? generalDiscount,
    String? bannerimg,
    String? title,
    String? couponCode,
    String? description,
    int? totalUsers,
    int? usesPerCustomer,
    String? discountType,
    List<TieredDiscount>? tieredDiscounts,
    List<Benefitsmodel>? benefitsmodel,
    String? bundleType,
  }) {
    return OfferDetails(
      OfferId: OfferId ?? this.OfferId,
      generalDiscount: generalDiscount ?? this.generalDiscount,
      bannerimg: bannerimg ?? this.bannerimg,
      title: title ?? this.title,
      couponCode: couponCode ?? this.couponCode,
      description: description ?? this.description,
      totalUsers: totalUsers ?? this.totalUsers,
      usesPerCustomer: usesPerCustomer ?? this.usesPerCustomer,
      discountType: discountType ?? this.discountType,
      tieredDiscounts: tieredDiscounts ?? this.tieredDiscounts,
      benefitsmodel: benefitsmodel ?? this.benefitsmodel,
      bundleType: bundleType ?? this.bundleType,
    );
  }

  @override
  String toString() {
    return 'OfferDetails(generalDiscount: $generalDiscount, bannerimg: $bannerimg, title: $title, couponCode: $couponCode, description: $description, totalUsers: $totalUsers, usesPerCustomer: $usesPerCustomer, discountType: $discountType, tieredDiscounts: $tieredDiscounts, benefitsmodel: $benefitsmodel, bundleType: $bundleType)';
  }
}

class Benefitsmodel {
  int? discountValue;
  String? discountUnit;
  String? validFrom;
  String? validTill;
  Benefitsmodel({
    this.discountValue,
    this.discountUnit,
    this.validFrom,
    this.validTill,
  });
  Benefitsmodel.frombenefit(Map<String, dynamic> json)
      : discountValue = json['discountValue'] ?? 0.0,
        discountUnit = json['discountUnit'] ?? '',
        validFrom = json["validFrom"] ?? "",
        validTill = json["validTill"] ?? "";

  Benefitsmodel copyWith({
    int? discountValue,
    String? discountUnit,
    String? validFrom,
    String? validTill,
  }) {
    return Benefitsmodel(
      discountValue: discountValue ?? this.discountValue,
      discountUnit: discountUnit ?? this.discountUnit,
      validFrom: validFrom ?? this.validFrom,
      validTill: validTill ?? this.validTill,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discountValue': discountValue,
      'discountUnit': discountUnit,
      'validFrom': validFrom,
      'validTill': validTill,
    };
  }
}

// Model for Tiered Discount
class TieredDiscount {
  int? spendvalue;
  int? discountValue;
  String? discountUnit;
  String? validfrom;
  String? validtill;

  TieredDiscount(
      {this.spendvalue,
      this.discountValue,
      this.discountUnit,
      this.validfrom,
      this.validtill});

  TieredDiscount.fromJson(Map<String, dynamic> json)
      : spendvalue = json['spendvalue'] ?? 0,
        discountValue = json['discountValue'] ?? 0,
        discountUnit = json['discountUnit'] ?? '',
        validfrom = json['validfrom'] ?? '',
        validtill = json['validtill'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'spendvalue': spendvalue,
      'discountValue': discountValue,
      'discountUnit': discountUnit,
      'validtill': validtill,
      'validfrom': validfrom,
    };
  }

  TieredDiscount copyWith({
    int? spendThreshold,
    int? discountValue,
    String? discountUnit,
    String? validFrom,
    String? validTill,
  }) {
    return TieredDiscount(
      spendvalue: spendvalue ?? this.spendvalue,
      discountValue: discountValue ?? this.discountValue,
      discountUnit: discountUnit ?? this.discountUnit,
      validfrom: validFrom ?? this.validfrom,
      validtill: validTill ?? this.validtill,
    );
  }
}
