import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Iconcontainer extends StatelessWidget {
  IconData icon;
  Function onpressed;
  Iconcontainer({super.key, required this.icon, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onpressed();
      },
      child: Container(
        height: 51.h,
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        decoration: BoxDecoration(
            color: manageData.appColors.white,
            borderRadius: BorderRadius.circular(10.r)),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
