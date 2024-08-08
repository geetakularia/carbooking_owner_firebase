import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/constant/image.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final font = manageData.appTextTheme;
    final clr = manageData.appColors;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: AppServices.screenHeight(context),
        width: AppServices.screenWidth(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AppImage().login_img))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlurryContainer(
                blur: 15,
                width: AppServices.screenWidth(context),
                elevation: 0,
                color: Colors.white10,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     languageconst.forgotPasswordTitle.tr,
                      style: font.fs24Medium.copyWith(color: clr.white),
                    ),
                    heightY(20.h),
                    Text(
                     languageconst.enterEmailOrMobile.tr,
                      style: font.fs16Normal.copyWith(color: clr.white),
                    ),
                    heightY(20.h),
                    Text(
                      languageconst.emailOrMobile.tr,
                      style: font.fs16Normal.copyWith(color: clr.white),
                    ),
                    heightY(10.h),
                    Primary_txtField(hint_txt: "student@gmail.com"),
                    heightY(20.h),
                    Row(
                      children: [
                        PrimaryButton(
                          title: languageconst.continueButton.tr,
                          onPressed: () {
                            Get.toNamed(RoutesName.otp_screen);
                          },
                          isExpanded: true,
                        ),
                      ],
                    ),
                    heightY(20.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton.icon(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: clr.white,
                          ),
                          label: Text(
                           languageconst.backToLogin.tr,
                            style: font.fs16Normal.copyWith(color: clr.white),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
