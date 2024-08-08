import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Answertextfield extends StatefulWidget {
  const Answertextfield({
    super.key,
  });

  @override
  State<Answertextfield> createState() => _AnswertextfieldState();
}

class _AnswertextfieldState extends State<Answertextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(languageconst.Answer.tr, style: manageData.appTextTheme.fs16Normal),
        heightY(10.h),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: manageData.appColors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: manageData.appColors.white)),
            border: InputBorder.none,
            fillColor: manageData.appColors.white,
            filled: true,
            hintText: languageconst.enteranswerhere.tr,
            hintStyle: manageData.appTextTheme.fs16Normal,
          ),
        ),
      ],
    );
  }
}
