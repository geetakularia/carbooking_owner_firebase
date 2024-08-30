import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Descriptiontextfield extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  Descriptiontextfield({super.key, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(languageconst.description.tr,
            style: manageData.appTextTheme.fs16Normal),
        heightY(10.h),
        TextField(
          maxLines: 5,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: manageData.appColors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: manageData.appColors.white)),
            border: InputBorder.none,
            fillColor: manageData.appColors.bgclr,
            filled: true,
            hintText: hint,
            hintStyle: manageData.appTextTheme.fs16Normal,
          ),
        ),
      ],
    );
  }
}
