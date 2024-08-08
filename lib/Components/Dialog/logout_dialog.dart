import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Logout_dialog extends StatelessWidget {
  String image, title;
  String? subtitle;
  Function onpressed_Yes;
  Function onpressed_No;
  Logout_dialog({
    super.key,
    required this.image,
    required this.onpressed_No,
    required this.onpressed_Yes,
    this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: WillPopScope(
          onWillPop: () async => true,
          child: Container(
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightY(10.h),
                  Image.asset(image),
                  heightY(10.h),
                  Text(
                    title,
                    style: manageData.appTextTheme.fs16Medium
                        .copyWith(color: manageData.appColors.red),
                    textAlign: TextAlign.center,
                  ),
                  heightY(10.h),
                  Text(
                    subtitle!,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                    textAlign: TextAlign.center,
                  ),
                  heightY(15.h),
                  Row(
                    children: [
                      Expanded(
                          child: PrimaryButton(
                        title: languageconst.no.tr,
                        backGroundTransparent: true,
                        onPressed: () {
                          onpressed_No();
                        },
                      )),
                      widthX(10.w),
                      Expanded(
                          child: PrimaryButton(
                              title: languageconst.yes.tr,
                              onPressed: () {
                                onpressed_Yes();
                              }))
                    ],
                  ),
                ]),
          ),
        ));
  }
}
