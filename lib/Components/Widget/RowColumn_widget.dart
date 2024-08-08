import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class RowColumn_Widget extends StatelessWidget {
  String firsttxt, secondtxt;
  String? img;
  RowColumn_Widget(
      {super.key, required this.firsttxt, required this.secondtxt, this.img});

  @override
  Widget build(BuildContext context) {
    final decoration = ConstantSheet.instance;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Text(
            firsttxt,
            style: decoration.appTextTheme.fs16Normal
                .copyWith(color: decoration.appColors.gray),
          ),
          widthX(5.w),
          img == null ? SizedBox() : SvgPicture.asset(img!)
        ],
      ),
      Text(
        secondtxt,
        style: decoration.appTextTheme.fs16Normal,
      )
    ]);
  }
}
