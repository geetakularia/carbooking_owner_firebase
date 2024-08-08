import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Components/CustomClipper/Datetime_Clipper.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Notificationlile_widget extends StatelessWidget {
  String image, title, subtitle, time;
  Notificationlile_widget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.manageData,
  });

  final ConstantSheet manageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: manageData.appColors.bgclr,
          minRadius: 30,
          child: Image.asset(
            image,
            height: 50.h,
            width: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        widthX(10.w),
        Expanded(
          child: Stack(alignment: Alignment.topRight, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: manageData.appColors.white),
              margin: EdgeInsets.only(bottom: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: manageData.appTextTheme.fs16Normal,
                      ),
                    ],
                  ),
                  heightY(3.h),
                  Text(
                    subtitle,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: DatetimeClipper(),
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 5).copyWith(right: 10.w),
                width: 90.w,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(13.r),
                        bottomLeft: Radius.circular(13.r)),
                    color: manageData.appColors.primary),
                child: Text(
                  time,
                  style: manageData.appTextTheme.fs12Normal
                      .copyWith(color: manageData.appColors.white),
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
