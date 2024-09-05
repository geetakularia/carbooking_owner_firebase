import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

Future<String> getImageFormGallery() async {
  // ignore: invalid_use_of_visible_for_testing_member
  var getImage = await ImagePicker.platform
      .getImageFromSource(source: ImageSource.gallery);
  String imageFile = "";
  if (getImage != null) {
    imageFile = getImage.path;
  }
  return imageFile;
}

Future<String> getImageFormCamra() async {
  var getImage =
      // ignore: invalid_use_of_visible_for_testing_member
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String imageFile = "";
  if (getImage != null) {
    imageFile = getImage.path;
  }
  return imageFile;
}

/////---------------VIDEO FUNCTION

Future<File?> getvideoFormGallery() async {
  final XFile? pickedFile =
      await ImagePicker().pickVideo(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null; // Return null if no video is picked
}

Future<File?> getvideoFormCamra() async {
  final XFile? pickedFile =
      await ImagePicker().pickVideo(source: ImageSource.camera);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null; // Return null if no video is picked
}

VideoPickerbottomsheet(
    BuildContext context, Function(File) file, Function delete) {
  return ClipRect(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: Column(children: [
            Gap(15.h),
            Text(
              "Image Picker",
            ),
            Gap(10.h),
            ElevatedButton.icon(
                onPressed: () async {
                  File? filePath = await getvideoFormCamra();
                  if (filePath != null) {
                    file(filePath);
                  }
                },
                icon: Icon(Icons.camera),
                label: Text("Camera")),
            ElevatedButton.icon(
                onPressed: () async {
                  File? filePath = await getvideoFormGallery();
                  if (filePath != null) {
                    file(filePath);
                  }
                },
                icon: Icon(Icons.video_file),
                label: Text("Gallery")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
                label: Text("Cancel")),
            ElevatedButton.icon(
                onPressed: () {
                  delete();
                },
                icon: Icon(Icons.delete),
                label: Text("delete")),
          ])));
}

Future<String> delete_img() async {
  var getImagegallery = await ImagePicker.platform
      .getImageFromSource(source: ImageSource.gallery);
  var getImagecamera =
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String imageFile = "";
  if (getImagegallery != null) {
    imageFile = getImagegallery.path;
  }
  if (getImagecamera != null) {
    imageFile = getImagecamera.path;
  }
  return imageFile;
}

imagePickerbottomsheet(
    BuildContext context, Function(File) file, Function delete) {
  return ClipRect(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: 270,
          child: Column(children: [
            Gap(15.h),
            Text(
              "Image Picker",
              // style: AppTextTheme.fs20SemiBold(),
            ),
            Gap(10.h),
            ElevatedButton.icon(
                onPressed: () async {
                  File file_path = File(await getImageFormCamra());
                  file(file_path);
                  // App_service(context).popTo();
                },
                icon: Icon(Icons.camera),
                label: Text("Camera")),
            ElevatedButton.icon(
                onPressed: () async {
                  File file_path = File(await getImageFormGallery());
                  file(file_path);
                  // App_service(context).popTo();
                },
                icon: Icon(Icons.image),
                label: Text("Gallery")),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
                label: Text("Cancel")),
            ElevatedButton.icon(
                onPressed: () {
                  delete();
                },
                icon: Icon(Icons.delete),
                label: Text("delete")),
          ])));
}
