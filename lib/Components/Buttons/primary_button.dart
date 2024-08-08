import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isExpanded;
  final bool isloading;
  final bool backGroundTransparent;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.backGroundTransparent = false,
      this.isExpanded = false,
      this.isloading = false,});

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
        onPressed: () {
          isloading ? null : onPressed();
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            backgroundColor: backGroundTransparent
                ? Colors.transparent
                : manageData.appColors.primary,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: manageData.appColors.primary),
                borderRadius: BorderRadius.circular(10.r))),
        child: isloading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: CircularProgressIndicator(
                  color: manageData.appColors.white,
                ),
              )
            : Text(
                title,
                style:  manageData.appTextTheme.fs16Normal.copyWith(
                        color: backGroundTransparent
                            ? manageData.appColors.primary
                            : manageData.appColors.white),
              ));
    return isExpanded ? Expanded(child: button) : button;
  }
}
