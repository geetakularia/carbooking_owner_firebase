import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Upidialog_widget extends StatelessWidget {
  const Upidialog_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.all(20.sp),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: manageData.appColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              minLeadingWidth: 0,
              subtitle: Text("add your UPI ID",
                  style: manageData.appTextTheme.fs14Normal),
              title: Text(
                "UPI",
                style: manageData.appTextTheme.fs18Medium
                    .copyWith(color: manageData.appColors.black),
              ),
              leading: Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: manageData.appColors.gray.withOpacity(0.6))),
                  child: SvgPicture.asset(
                    manageData.appsvgimg.upi,
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide:
                                BorderSide(color: manageData.appColors.gray)),
                        hintText: "Enter your UPI ID",
                        helperStyle: manageData.appTextTheme.fs14Normal,
                        suffixIcon: SizedBox(
                          height: 44.h,
                          width: 44.w,
                          child: Center(
                            child: SvgPicture.asset(
                              manageData.appsvgimg.payment,
                              height: 30.h,
                              width: 30.w,
                              color:
                                  manageData.appColors.black.withOpacity(0.4),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r))),
                  ),
                  heightY(15.h),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                          width: 150.w,
                          child:
                              PrimaryButton(title: " Save ", onPressed: () {})))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
