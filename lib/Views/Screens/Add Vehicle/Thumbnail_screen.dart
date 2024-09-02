import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Dialog/UploadDialog.dart';
import 'package:car_booking_owner/Components/Widget/Addrowicon_widget.dart';
import 'package:car_booking_owner/Components/Widget/Thumbnail_widget.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Thumbnail_screen extends StatefulWidget {
  const Thumbnail_screen({super.key});

  @override
  State<Thumbnail_screen> createState() => _Thumbnail_screenState();
}

class _Thumbnail_screenState extends State<Thumbnail_screen> {
  final carController = Get.find<FirebaseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.uploadVehicle.tr,
              onPressed: () async {
                final data = carController.car.copyWith();
                await carController.addvehicle(data).whenComplete(
                  () {
                    Future.delayed(Duration(seconds: 2), () {
                      Get.back();
                      Get.to(BottomScreen(
                        currentIndex: 3,
                      ));
                    });
                    Get.dialog(Primary_dialog(
                        image: manageData.appimage.vehicle,
                        title: languageconst.vehicleAddedSuccessfully.tr,
                        subtitle:
                            languageconst.uploadingVehicleListPleaseWait.tr));
                  },
                );
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leadingWidth: 40.w,
        title: Text(
          "Mercedes Benz Q80 ( 2023 )",
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightY(10.h),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.w),
              decoration: BoxDecoration(
                  color: manageData.appColors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Text(
                "${languageconst.step.tr} 3",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageconst.dragOrDropImage.tr,
                  style: manageData.appTextTheme.fs14Normal
                      .copyWith(color: manageData.appColors.gray),
                ),
                heightY(15.h),
                Thumbnail_widget(title: languageconst.thumbnail.tr),
                heightY(10.h),
                AddrowwithIcon_widget(
                    title: languageconst.addPhotos.tr,
                    onpressed: () {
                      Future.delayed(Duration(seconds: 3), () {
                        Get.back();
                      });
                      Get.dialog(Dialog(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        child: UploadDialog(),
                      ));
                    }),
                heightY(10.h),
                Row(
                  children: [
                    Image.asset(manageData.appimage.bmw),
                    widthX(20.w),
                    Image.asset(manageData.appimage.bmw),
                  ],
                ),
                heightY(10.h),
                AddrowwithIcon_widget(
                  title: languageconst.addVideos.tr,
                  onpressed: () {
                    Get.toNamed("/VideoScreen");
                  },
                ),
                heightY(15.h),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(manageData.appimage.bmw),
                  SvgPicture.asset(manageData.appsvgimg.playbtn)
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
