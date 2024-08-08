import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/Components/Text_field/Descriptiontextfield.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Mercedesbenz_screen extends StatefulWidget {
  const Mercedesbenz_screen({super.key});

  @override
  State<Mercedesbenz_screen> createState() => _Mercedesbenz_screenState();
}

class _Mercedesbenz_screenState extends State<Mercedesbenz_screen> {
  String? packagetypevalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.w,
        title: Text(
          "Mercedes Benz Q80 ( 2023 )",
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            //   decoration: BoxDecoration(
            //       color: manageData.appColors.black,
            //       borderRadius:
            //           BorderRadius.horizontal(right: Radius.circular(20.r))),
            //   child: Text(
            //     "Mercedes Benz Q80 ( 2023 )",
            //     style: manageData.appTextTheme.fs24Normal
            //         .copyWith(color: manageData.appColors.white),
            //   ),
            // ),
            // heightY(5.h),
            heightY(10.h),

            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
                decoration: BoxDecoration(
                    color: manageData.appColors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r))),
                child: Text(
                  "${languageconst.step.tr} 2",
                  style: manageData.appTextTheme.fs16Normal
                      .copyWith(color: manageData.appColors.white),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(15.sp),
              width: AppServices.screenWidth(context),
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                  color: manageData.appColors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageconst.addBookingPriceAndDescription.tr,
                        style: manageData.appTextTheme.fs14Normal
                            .copyWith(color: manageData.appColors.gray),
                      ),
                      heightY(10.h),
                      Descriptiontextfield(
                        hint: "write something about  your car as Intro",
                      ),
                      heightY(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            languageconst.createPackage.tr,
                            style: manageData.appTextTheme.fs16Normal,
                          ),
                          SvgPicture.asset(manageData.appsvgimg.add)
                        ],
                      ),
                      heightY(17.h),
                      Row(
                        children: [
                          Expanded(
                            child: Primarydropdownbutton_widget(
                                hint: "Per hour",
                                selectedValue: packagetypevalue,
                                dropdownItems: Localdata.packagedata,
                                title: languageconst.packageType.tr),
                          ),
                          widthX(15.w),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                languageconst.amount.tr,
                                style: manageData.appTextTheme.fs16Normal
                                    .copyWith(
                                        color: manageData.appColors.primary),
                              ),
                              heightY(10.h),
                              Primary_txtField(
                                hint_txt: "650",
                                fillcolor: true,
                              ),
                            ],
                          )),
                          widthX(15.w),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                                color: manageData.appColors.bgclr,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Icon(
                              Icons.delete_outlined,
                              color: manageData.appColors.red,
                              size: 30.sp,
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      title: languageconst.continueButton.tr,
                      onPressed: () {
                        Get.toNamed("/thumbnail_screen");
                      },
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
