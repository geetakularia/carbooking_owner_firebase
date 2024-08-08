import 'package:car_booking_owner/Components/Widget/Settingcard_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationSetting_screen extends StatefulWidget {
  const NotificationSetting_screen({super.key});

  @override
  State<NotificationSetting_screen> createState() =>
      _NotificationSetting_screenState();
}

class _NotificationSetting_screenState
    extends State<NotificationSetting_screen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var manageData2 = manageData;
    return Scaffold(
      appBar: AppBar(
        title: Text(languageconst.notificationSettings.tr,
            style: manageData2.appTextTheme.fs24Normal),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightY(15.h),
            Text(
              languageconst.inAppNotification.tr,
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.gray),
            ),
            heightY(10.h),
            SettingCard(title: languageconst.receiveNotificationWithinApp.tr),
            heightY(15.h),
            Text(
              languageconst.systemNotification.tr,
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.gray),
            ),
            heightY(10.h),
            SettingCard(title: languageconst.receiveNotificationWithinApp.tr),
            heightY(15.h),
            Text(
              languageconst.behaviour.tr,
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.gray),
            ),
            heightY(10.h),
            SettingCard(title: languageconst.allowWakeDeviceNotification.tr),
            heightY(10.h),
            SettingCard(title: languageconst.disableNotificationVibration.tr),
            heightY(10.h),
            SettingCard(title: languageconst.doNotDisturb.tr),
          ],
        ),
      ),
    );
  }
}
