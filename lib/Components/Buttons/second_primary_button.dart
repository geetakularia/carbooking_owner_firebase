import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isExpanded;
  final bool isloading;
  final bool backGroundTransparent;
  final IconData icon;
  const SecondPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.backGroundTransparent = false,
    this.isExpanded = false,
    this.isloading = false, 
  });

  @override
  Widget build(BuildContext context) {
    final button = TextButton.icon(
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
        icon: Icon(
          icon,
          size: 24.sp,
          color: backGroundTransparent
              ? manageData.appColors.primary
              : manageData.appColors.white,
        ),
        label: isloading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: CircularProgressIndicator(
                  color: manageData.appColors.white,
                ),
              )
            : Text(
                title,
                style: manageData.appTextTheme.fs16Normal.copyWith(
                    color: backGroundTransparent
                        ? manageData.appColors.primary
                        : manageData.appColors.white),
              ));
    return isExpanded
        ? Row(
            children: [
              Expanded(child: button),
            ],
          )
        : button;
  }
}
