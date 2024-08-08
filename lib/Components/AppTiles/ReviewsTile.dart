import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsTle extends StatelessWidget {
  const ReviewsTle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppServices.screenWidth(context) * 0.8,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: manageData.appColors.lightgray.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
          color: manageData.appColors.white,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(manageData.appimage.car_profile))),
                  widthX(5.h),
                  Text(
                    "Mr joe Deo",
                    style: manageData.appTextTheme.fs16Normal,
                  ),
                  widthX(5.w),
                  Text(
                    "1hr ago",
                    style: manageData.appTextTheme.fs12Normal
                        .copyWith(color: manageData.appColors.gray),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "4.5",
                    style: manageData.appTextTheme.fs12Normal,
                  ),
                  widthX(3.w),
                  Icon(
                    Icons.star,
                    color: manageData.appColors.yellow,
                    size: 20,
                  )
                ],
              )
            ],
          ),
          heightY(10.h),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Magna porttitor a cum sagittis eget ac integer mauris a. Lacinia ",
            style: manageData.appTextTheme.fs14Normal
                .copyWith(color: manageData.appColors.gray),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
