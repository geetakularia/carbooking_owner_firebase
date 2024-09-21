import 'dart:io';

import 'package:car_booking_owner/Components/Widget/PrimaryContainer.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class Photo_upload extends StatefulWidget {
  Function(File) selectedImage;
  Photo_upload({
    required this.selectedImage,
    super.key,
  });

  @override
  State<Photo_upload> createState() => _Photo_uploadState();
}

class _Photo_uploadState extends State<Photo_upload> {
  final style = manageData;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
            context: context,
            builder: (context) => ImagePickBottomsheet(
                  file: (v) {
                    widget.selectedImage(v);
                    imageFile = v;
                    setState(() {});
                  },
                ));
      },
      child: imageFile == null
          ? Container(
              padding: EdgeInsets.all(10.sp),
              width: AppServices.screenWidth(context),
              decoration: BoxDecoration(
                  color: manageData.appColors.bgclr,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                children: [
                  Icon(
                    Icons.file_download_outlined,
                    size: 50,
                  ),
                  heightY(10),
                  Text(
                    languageconst.dragOrDropImage.tr,
                    textAlign: TextAlign.center,
                  ),
                ],
              ))
          : ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Image.file(
                imageFile!,
                height: 100,
                width: AppServices.screenWidth(context),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}

//***********************  image picker bottom sheet
// */
// ignore: must_be_immutable
class ImagePickBottomsheet extends StatelessWidget {
  String? title;
  Function(File) file;
  ImagePickBottomsheet({super.key, this.title, required this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
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
                child: Icon(Icons.keyboard_arrow_up_outlined)),
          ),
          heightY(15.h),
          Text(
            title ?? "",
            style: manageData.appTextTheme.fs16Normal,
          ),
          heightY(15.h),
          Divider(
            color: manageData.appColors.gray,
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
                  child: PrimaryContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(manageData.appsvgimg.gallery),
                        heightY(15.h),
                        Text(
                          "Gallery",
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
                  child: PrimaryContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(manageData.appsvgimg.camera),
                        heightY(10.h),
                        Text(
                          "Camera",
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
