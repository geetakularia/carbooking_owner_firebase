import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  const PrimaryContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.margin,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      width: width ??AppServices.screenWidth(context),
      padding: padding ?? EdgeInsets.all(10.sp),
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? manageData.appColors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
      ),
      child: child,
    );
  }
}
