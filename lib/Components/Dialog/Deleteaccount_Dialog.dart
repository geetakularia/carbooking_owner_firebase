// ignore: must_be_immutable
import 'package:car_booking_owner/Components/Buttons/SimpleButton.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Deleteaccount_dialog extends StatelessWidget {
  Deleteaccount_dialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        // insetPadding: EdgeInsets.all(5),
        backgroundColor: Colors.transparent,
        child: WillPopScope(
          onWillPop: () async => true,
          child: Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightY(10.h),
                  Image.asset(manageData.appimage.deletedialog),
                  heightY(10.h),
                  Text(
                    languageconst.areYouSure.tr,
                    style: manageData.appTextTheme.fs16Medium
                        .copyWith(color: manageData.appColors.red),
                    textAlign: TextAlign.center,
                  ),
                  heightY(10.h),
                  Text(
                    languageconst.deleteAccountPermanently.tr,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                    textAlign: TextAlign.center,
                  ),
                  heightY(15.h),
                  Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          style: manageData.appTextTheme.fs12Normal
                              .copyWith(color: manageData.appColors.gray),
                          text: languageconst
                              .understandConsequencesOfDeletingAccount.tr,
                          children: [
                            TextSpan(
                              text: " (${languageconst.lossOfData.tr})",
                              style: manageData.appTextTheme.fs12Bold
                                  .copyWith(color: manageData.appColors.black),
                            )
                          ])),
                  heightY(15.h),
                  Row(
                    children: [
                      SimpleButton(
                        title: languageconst.deleteAccount.tr,
                        onPressed: () {
                          Get.toNamed("/login_screen");
                        },
                        backGroundTransparent: true,
                      ),
                      widthX(10.w),
                      SimpleButton(
                          title: languageconst.keepAccount.tr,
                          onPressed: () {
                            Get.back();
                          })
                    ],
                  ),
                ]),
          ),
        ));
  }
}
