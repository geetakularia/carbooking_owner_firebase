import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Primary_dialog extends StatelessWidget {
  String image, title, subtitle;
  Primary_dialog(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: WillPopScope(
        onWillPop: () async => false,
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
                style: manageData.appTextTheme.fs18Medium,
                textAlign: TextAlign.center,
              ),
              heightY(10.h),
              Text(
                subtitle,
                style: manageData.appTextTheme.fs12Normal,
              ),
              heightY(30)
            ],
          ),
        ),
      ),
    );
  }
}
