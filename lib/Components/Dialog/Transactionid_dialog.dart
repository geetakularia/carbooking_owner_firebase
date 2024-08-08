import 'package:car_booking_owner/Components/CustomClipper/Close_clipper.dart';
import 'package:car_booking_owner/Components/Widget/Custombackbutton.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Transactionid_Dialog extends StatelessWidget {
  const Transactionid_Dialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Stack(alignment: Alignment.topRight, children: [
        Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: manageData.appColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          languageconst.transactionID.tr,
                          style: manageData.appTextTheme.fs14Normal,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'XX154520',
                          style: manageData.appTextTheme.fs14Normal
                              .copyWith(color: manageData.appColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              heightY(12.h),
              Divider(
                thickness: 2,
              ),
              heightY(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mr Rakesh sharma",
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.primary),
                  ),
                  Text(
                    languageconst.time.tr,
                    style: manageData.appTextTheme.fs12Normal,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "+91 80410 12450",
                    style: manageData.appTextTheme.fs12Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                  Text(
                    "10:am",
                    style: manageData.appTextTheme.fs12Normal,
                  )
                ],
              ),
              heightY(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageconst.amount.tr,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                  Text(
                    "₹ 1,200",
                    style: manageData.appTextTheme.fs16Normal,
                  )
                ],
              ),
              heightY(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageconst.modeOfPayment.tr,
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.gray),
                  ),
                  Text(
                    languageconst.cash.tr,
                    style: manageData.appTextTheme.fs16Normal,
                  )
                ],
              ),
              heightY(12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        languageconst.Promocodeapplied.tr,
                        style: manageData.appTextTheme.fs14Normal
                            .copyWith(color: manageData.appColors.gray),
                      ),
                      widthX(10.w),
                      SvgPicture.asset(manageData.appsvgimg.payment)
                    ],
                  ),
                  Text(
                    "₹ 200",
                    style: manageData.appTextTheme.fs16Normal,
                  )
                ],
              ),
              heightY(12.h),
              Divider(),
              Text(
                languageconst.PaidAmount.tr,
                style: manageData.appTextTheme.fs14Normal
                    .copyWith(color: manageData.appColors.gray),
              ),
              Text(
                "₹ 1000",
                style: manageData.appTextTheme.fs24Normal
                    .copyWith(color: manageData.appColors.green),
              ),
            ],
          ),
        ),
        ClipPath(clipper: CloseClipper(), child: CustomBackbutton()),
      ]),
    );
  }
}


