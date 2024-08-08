import 'package:car_booking_owner/Components/Widget/helplistile_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Helpsupport_screen extends StatelessWidget {
  const Helpsupport_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageconst.helpAndSupport.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageconst.connectWithExpertsForHelp.tr,
              style: manageData.appTextTheme.fs14Normal,
            ),
            heightY(20.h),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => heightY(17.h),
                itemCount: Helpsupportdata.helpsupportdata.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: manageData.appColors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Helpsupport_tile_widget(
                    onpressed: () {
                      pushto(Helpsupportdata.helpsupportdata[index].icon);
                    },
                    icon: Helpsupportdata.helpsupportdata[index].icon,
                    title: Helpsupportdata.helpsupportdata[index].title.tr,
                    trailing: Icons.keyboard_arrow_right_outlined,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

pushto(String id) {
  switch (id) {
    case "Service":
      return Get.toNamed("/customerService");
    case "WhatsApp":
      return null;
    case "deleteaccount":
      return Get.toNamed("/deleteaccount");
    case "tollfreenumber":
      return null;
  }
}
