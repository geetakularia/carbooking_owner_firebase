import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthCommonWidget extends StatelessWidget {
  final Widget widget;
  const AuthCommonWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: AppServices.screenHeight(context),
      width: AppServices.screenWidth(context),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                manageData.appimage.login_img,
              ))),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
          child: Center(
            child: BlurryContainer(
              blur: 15,
              width: AppServices.screenWidth(context),
              elevation: 0,
              color: Colors.white10,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              child: widget,
            ),
          ),
        ),
      ),
    );
  }
}
