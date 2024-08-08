import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBackbutton extends StatelessWidget {
  const CustomBackbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
          padding: EdgeInsets.only(right: 10.w),
          height: 25.h,
          width: 75.w,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6.r),
              ),
              color: manageData.appColors.primary),
          child: Icon(
            Icons.close,
            color: manageData.appColors.white,
          )),
    );
  }
}
