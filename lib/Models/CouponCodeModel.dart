import 'package:car_booking_owner/Models/carmodel.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoupOnCodeModel {
  String? couponId;
  String? couponcode;
  int? discount;
  int? alloweduser;
  CoupOnCodeModel({
    this.couponId,
    this.couponcode,
    this.discount,
    this.alloweduser,
  });

  CoupOnCodeModel copyWith({
    String? couponId,
    String? couponcode,
    int? discount,
    int? alloweduser,
  }) {
    return CoupOnCodeModel(
      couponId: couponId ?? this.couponId,
      couponcode: couponcode ?? this.couponcode,
      discount: discount ?? this.discount,
      alloweduser: alloweduser ?? this.alloweduser,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'couponcode': couponcode,
      'discount': discount,
      'alloweduser': alloweduser,
    };
  }

  CoupOnCodeModel.fromJson(FirebaseResponseModel josn)
      : couponId = josn.docid,
        couponcode = josn.data["couponcode"] ?? "",
        alloweduser = josn.data["alloweduser"] ?? 0,
        discount = josn.data["discount"] ?? 0;
}
