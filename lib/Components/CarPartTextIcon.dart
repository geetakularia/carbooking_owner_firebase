import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CarPartTextIcon extends StatelessWidget {
  final String title;
  final String iconpath;
  final TextStyle? style;
  final Color? svgclr;
  const CarPartTextIcon(
      {super.key,
      required this.title,
      required this.iconpath,
      this.style,
      this.svgclr});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconpath,
          height: 20.sp,
          width: 20.sp,
          color: svgclr == null ? manageData.appColors.white : svgclr,
        ),
        heightY(2.h),
        Text(title,
            style: style == null
                ? manageData.appTextTheme.fs10Normal
                    .copyWith(color: manageData.appColors.white)
                : style),
      ],
    );
  }
}
