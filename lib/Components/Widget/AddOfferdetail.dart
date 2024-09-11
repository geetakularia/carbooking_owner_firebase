// ignore: must_be_immutable
import 'dart:io';

import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Thumbnail_Banner_widget extends StatefulWidget {
  Thumbnail_Banner_widget({super.key});

  @override
  State<Thumbnail_Banner_widget> createState() =>
      _Thumbnail_Banner_widgetState();
}

class _Thumbnail_Banner_widgetState extends State<Thumbnail_Banner_widget> {
  var isChecked = false.obs;
  // File? imageFile;
  String image = "";
  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "${languageconst.thumbnail.tr} ( ${languageconst.showwithbanner.tr} )",
                style: manageData.appTextTheme.fs16Normal
                    .copyWith(color: manageData.appColors.primary)),
            Obx(() {
              return Checkbox(
                activeColor: manageData.appColors.primary,
                checkColor: Colors.white,
                value: isChecked.value,
                onChanged: toggleCheckbox,
              );
            }),
          ],
        ),
        heightY(15.h),
        /************ image of offers */
        image.isEmpty
            ? Container(
                width: AppServices.screenWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                decoration: BoxDecoration(
                    color: manageData.appColors.bgclr,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  children: [
                    SvgPicture.asset(manageData.appsvgimg.download_icon_2),
                    heightY(10.h),
                    Text(
                      languageconst.uploadimagevideo.tr,
                      style: manageData.appTextTheme.fs16Normal
                          .copyWith(color: manageData.appColors.gray),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            : Image.network(
                image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
      ],
    );
  }
}
