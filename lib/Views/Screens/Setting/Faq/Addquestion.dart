import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Text_field/Addquestion_textfield.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Addquestion_screen extends StatelessWidget {
  const Addquestion_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.Reset.tr,
              backGroundTransparent: true,
              onPressed: () {},
            ),
            widthX(10.w),
            PrimaryButton(
              title: languageconst.save.tr,
              onPressed: () {
                Future.delayed(Duration(seconds: 2), () {
                  Get.back();
                });
                Get.dialog(Primary_dialog(
                    image: manageData.appimage.addquestion,
                    title: languageconst.questionaddedsuccessfully.tr,
                    subtitle: languageconst.pleasewaitcustomerapp.tr));
              },
              isExpanded: true,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.addquestion.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageconst.addyourquestionanswer.tr,
                  style: manageData.appTextTheme.fs14Normal,
                ),
                heightY(15.h),
                Text(
                  languageconst.Question.tr,
                  style: manageData.appTextTheme.fs16Normal
                      .copyWith(color: manageData.appColors.primary),
                ),
                heightY(10.h),
                Primary_txtField(
                  hint_txt: languageconst.enterquestionhere.tr,
                ),
                heightY(15.h),
                Answertextfield()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
