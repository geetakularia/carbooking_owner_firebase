import 'package:car_booking_owner/Components/CustomClipper/Datetime_Clipper.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Usertile_widget extends StatelessWidget {
  String image, title, subtitle, trailingtext, time;
  Usertile_widget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.trailingtext,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
          decoration: BoxDecoration(
              color: manageData.appColors.white,
              borderRadius: BorderRadius.circular(13.r)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: manageData.appColors.bgclr, shape: BoxShape.circle),
                height: 50,
                width: 50,
                child: Text(
                  "\u{20B9}",
                  style: manageData.appTextTheme.fs26Normal,
                ),
              ),
              widthX(20.w),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: manageData.appTextTheme.fs16Normal,
                  ),
                  heightY(5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: manageData.appTextTheme.fs14Normal
                              .copyWith(color: manageData.appColors.gray),
                        ),
                      ),
                      widthX(10.w),
                      Text(
                        trailingtext,
                        style: manageData.appTextTheme.fs18Medium
                            .copyWith(color: manageData.appColors.green),
                      ),
                    ],
                  ),
                ],
              )),
            ],
          )),
      ClipPath(
        clipper: DatetimeClipper(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5).copyWith(right: 10.w),
          width: 100.w,
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
    ]);
  }
}
