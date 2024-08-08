import 'dart:io';

import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImagePickBottomsheet extends StatelessWidget {
  String? title;
  Function(File) file;
  ImagePickBottomsheet({super.key, this.title, required this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
          color: manageData.appColors.bgclr,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.keyboard_arrow_up_rounded)),
          ),
          heightY(15.h),
          Text(
            title ?? "",
            style: manageData.appTextTheme.fs16Normal,
          ),
          heightY(10.h),
          Divider(
            thickness: 1,
          ),
          heightY(15.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final imagePath = await getImageFormGallery();
                    file(File(imagePath));
                    Get.back();
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(manageData.appsvgimg.gallery),
                        heightY(10.h),
                        Text(
                          "gallery",
                          style: manageData.appTextTheme.fs16Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              widthX(30.w),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final imagePath = await getImageFormCamera();
                    file(File(imagePath));
                    Get.back();
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(manageData.appsvgimg.camera),
                        heightY(10.h),
                        Text(
                          "camera",
                          style: manageData.appTextTheme.fs16Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<String> getImageFormGallery() async {
  final ImagePicker picker = ImagePicker();
  // ignore: invalid_use_of_visible_for_testing_member
  var getImage = await picker.pickImage(source: ImageSource.gallery);
  // .getImageFromSource(source: ImageSource.gallery);
  String image = '';
  if (getImage != null) {
    image = getImage.path;
  }
  return image;
}

// Get Image Camra
Future<String> getImageFormCamera() async {
  var getImage =
      // ignore: invalid_use_of_visible_for_testing_member
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String image = '';
  if (getImage != null) {
    image = getImage.path;
  }
  return image;
}
