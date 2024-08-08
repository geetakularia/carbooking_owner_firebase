// ignore: must_be_immutable
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Thumbnail_widget extends StatelessWidget {
  String title;
  Thumbnail_widget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: manageData.appTextTheme.fs16Normal),
        heightY(15.h),
        Container(
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
        ),
      ],
    );
  }
}
