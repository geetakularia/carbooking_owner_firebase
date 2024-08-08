import 'dart:io';
import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Icon_container_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.save.tr,
              onPressed: () {},
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.profile.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please check and add your necessary details for your booking Profile",
                  style: manageData.appTextTheme.fs14Normal,
                ),
                heightY(20.h),
                Align(
                  alignment: Alignment.center,
                  child: Stack(children: [
                    Image.asset(
                      manageData.appimage.car_profile,
                      height: 75.h,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 2,
                      right: 0.2,
                      child: Container(
                        padding: EdgeInsets.all(4.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: manageData.appColors.white,
                        ),
                        child: SvgPicture.asset(manageData.appsvgimg.edit),
                      ),
                    )
                  ]),
                ),
                heightY(10.h),
                Text(
                  "Name ",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Primary_txtField(hint_txt: "Mr Joe leo"),
                heightY(20.h),
                Text(
                  "Email ",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primary_txtField(hint_txt: "johnleo@gmail.com"),
                    ),
                    widthX(20.w),
                    Iconcontainer(icon: Icons.lock_outline, onpressed: () {}),
                  ],
                ),
                heightY(20.h),
                Text(
                  "Mobile ",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primary_txtField(hint_txt: "+91 85641 86451"),
                    ),
                    widthX(20.w),
                    Iconcontainer(icon: Icons.phone_outlined, onpressed: () {}),
                  ],
                ),
                heightY(20.h),
                Text(
                  "Address",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primary_txtField(
                          hint_txt: "Rishi nagar 90 - S 99 gali 1"),
                    ),
                    widthX(20.w),
                    Iconcontainer(
                      icon: Icons.location_on_outlined,
                      onpressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
