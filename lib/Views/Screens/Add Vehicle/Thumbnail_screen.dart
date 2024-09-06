import 'dart:io';
import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Dialog/UploadDialog.dart';
import 'package:car_booking_owner/Components/ImagePickerWidget.dart';
import 'package:car_booking_owner/Components/Widget/Addrowicon_widget.dart';
import 'package:car_booking_owner/Components/Widget/Thumbnail_widget.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Functions/Addimg.dart';
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
  File? imageFile;
  File? videoFile;
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
                // Upload the video ///////////

                final videoUrl = await uploadecarvideo(videoFile!);

                // Upload the  image ///////////

                final image = await uploadecarvideo(imageFile!);

                final data = carController.car.copyWith(
                    image: [image], videos: [videoUrl], carstatus: "Available");
                // videos: [videoUrl]);
                await carController
                    .addvehicle(data.toAddvehicle())
                    .whenComplete(
                  () {
                    Future.delayed(Duration(milliseconds: 300), () async {
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
                      Future.delayed(Duration(seconds: 1), () async {
                        Get.back();
                      });
                      Get.dialog(Dialog(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      imagePickerbottomsheet(context, (v) {
                                        if (v.path.isNotEmpty) {
                                          setState(() {
                                            imageFile = v;
                                          });
                                        } else {
                                          null;
                                        }
                                      }, () {
                                        setState(() {
                                          imageFile = null;
                                        });
                                        Get.back();
                                      }));
                            },
                            child: UploadDialog()),
                      ));
                    }),
                heightY(10.h),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: imageFile == null
                            ? null
                            : Image.file(
                                File(imageFile!.path),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )),
                    widthX(20.w),
                    Image.asset(manageData.appimage.bmw),
                  ],
                ),
                heightY(10.h),
                AddrowwithIcon_widget(
                  title: languageconst.addVideos.tr,
                  onpressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            VideoPickerbottomsheet(context, (v) {
                              if (v.path.isNotEmpty) {
                                setState(() {
                                  videoFile = v;
                                });
                              } else {
                                null;
                              }
                            }, () {
                              setState(() {
                                videoFile = null;
                              });
                              Get.back();
                            }));
                  },
                ),
                heightY(15.h),
                Stack(alignment: Alignment.center, children: [
                  videoFile == null ? SizedBox() : Text(videoFile!.path),
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
