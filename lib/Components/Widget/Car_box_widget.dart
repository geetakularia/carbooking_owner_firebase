// ignore_for_file: must_be_immutable

import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarBoxWidget extends StatelessWidget {
  String totalbooking, numberofcar;
  CarBoxWidget(
      {super.key, required this.totalbooking, required this.numberofcar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      decoration: BoxDecoration(
          color: manageData.appColors.lightgray,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightY(10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
            decoration: BoxDecoration(
                color: manageData.appColors.gray.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r))),
            child: Text(
              totalbooking,
              style: manageData.appTextTheme.fs12Normal,
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                numberofcar,
                style: manageData.appTextTheme.fs34Normal,
              )),
          // heightY(10),
        ],
      ),
    );
  }
}
