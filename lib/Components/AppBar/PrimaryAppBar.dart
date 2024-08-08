import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar({super.key, super.title});
  @override
  Widget? get leading => IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back));

  @override
  Color? get backgroundColor => Colors.transparent;
  @override
  double? get elevation => 0;
  @override
  TextStyle? get titleTextStyle => manageData.appTextTheme.fs24Normal
      .copyWith(color: manageData.appColors.black);
}
