import 'dart:async';

import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Widget/AuthCommonWidget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Utils/app_validators.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formkey = GlobalKey<FormState>();
  String otp = "";
  int time = 30;
  @override
  void initState() {
    super.initState();
    getTimer();
  }

  @override
  Widget build(BuildContext context) {
    final font = manageData.appTextTheme;
    final clr = manageData.appColors;
    return Scaffold(
        body: AuthCommonWidget(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageconst.verificationStep.tr,
            style: font.fs24Medium.copyWith(color: clr.white),
          ),
          heightY(20.h),
          Text(
            languageconst.verificationCodeSent.tr,
            style: font.fs16Normal.copyWith(color: clr.white),
          ),
          heightY(20.h),
          Text(
            languageconst.pleaseenterotp.tr,
            style: font.fs16Normal.copyWith(color: clr.white),
          ),
          heightY(15.h),
          Form(
            key: _formkey,
            child: Pinput(
              validator: (value) => TextValidator().validator(value),
              onChanged: (v) => setState(() {
                otp = v;
              }),
              length: 5,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              defaultPinTheme: PinTheme(
                  width: 50.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                      color: clr.white,
                      borderRadius: BorderRadius.circular(5.r))),
            ),
          ),
          // heightY(20.h),

          heightY(30.h),
          time == 0
              ? Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      languageconst.resendOTP.tr,
                      style: font.fs16Normal.copyWith(color: clr.white),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Text(
                    "0:${time} ${languageconst.secondsLeft.tr}",
                    style: font.fs16Normal.copyWith(color: clr.white),
                  ),
                ),
          heightY(40.h),
          Row(
            children: [
              PrimaryButton(
                title: languageconst.verify.tr,
                onPressed: () {
                  valideinput();
                },
                isExpanded: true,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  valideinput() {
    if (_formkey.currentState!.validate()) {
      Get.toNamed(RoutesName.CreatePassword_Screen);
    }
  }

  getTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time = time - 1;
        setState(() {});
      } else {
        timer.cancel();
        print("otp time out ");
      }
    });
  }
}
