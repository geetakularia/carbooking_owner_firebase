import 'dart:io';

import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Functions/Addimg.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Views/Screens/Add%20Vehicle/Thumbnail_screen.dart';
import 'package:car_booking_owner/Views/Screens/Vehicles/ImageShowScreen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PhotovideoScreen extends StatefulWidget {
  PhotovideoScreen({
    super.key,
  });

  @override
  State<PhotovideoScreen> createState() => _PhotovideoScreenState();
}

class _PhotovideoScreenState extends State<PhotovideoScreen> {
  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final carController = Get.find<FirebaseController>();

    final id = Get.arguments["car_id"];

    return Scaffold(
      bottomNavigationBar: PrimaryButton(
        title: languageconst.uploadVehicle.tr,
        onPressed: () async {
          // // Check if video file is selected
          // if (videoFile == null) {
          //   Get.snackbar("Error", "Please select a video to upload.");
          //   return;
          // }

          // // Upload the video
          // final videoUrl = await uploadecarvideo(videoFile!);

          // Upload the images using the separate function
          List<String> imageUrls = await uploadImages(imageFiles);

          final data = carController.car.copyWith(
            image: imageUrls,
            // videos: [videoUrl],
            carstatus: "Available",
          );

          await carController.addvehicle(data.toAddvehicle()).whenComplete(
            () {
              Future.delayed(Duration(milliseconds: 300), () async {
                Get.back();
                // Get.to(BottomScreen(
                //   currentIndex: 3,
                // ));
              });
              // Get.dialog(Primary_dialog(
              //     image: manageData.appimage.vehicle,
              //     title: languageconst.vehicleAddedSuccessfully.tr,
              //     subtitle:
              //         languageconst.uploadingVehicleListPleaseWait.tr));
            },
          );
        },
        isExpanded: true,
      ),
      appBar: AppBar(
        title: Text(
          "Photos",
          style: manageData.appTextTheme.fs18Normal,
        ),
        actions: [
          IconButton(
              onPressed: () {
                imageFiles.isNotEmpty
                    ? Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: imageFiles.map((file) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              file,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      )
                    : Center(child: Text('No images selected'));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<FirebaseController>(
                builder: (controller) {
                  final dataId = controller.getallcars.firstWhere(
                      (e) => e.car_id == id,
                      orElse: () => Car_model());
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: dataId.image!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(ImageShowScreen(
                              image: dataId.image![index],
                              imageList: dataId.image!));
                        },
                        child: Stack(alignment: Alignment.topRight, children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.network(
                              height: AppServices.screenHeight(context),
                              width: AppServices.screenWidth(context),
                              dataId.image![index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          PopupMenuButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0.r),
                              ),
                            ),
                            icon: Container(
                              // padding: EdgeInsets.symmetric(
                              //     vertical: 4.h, horizontal: 4.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [
                                  BoxShadow(
                                      color: manageData.appColors.gray
                                          .withOpacity(0.2),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0))
                                ],
                                color: manageData.appColors.white,
                              ),
                              child: Icon(
                                Icons.more_vert,
                                color: manageData.appColors.primary,
                              ),
                            ),
                            color: Colors.white,
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  onTap: () {
                                    print("===============");
                                    deletevehicleImg(
                                        dataId, dataId.image![index]);
                                  },
                                  value: languageconst.Delete.tr,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(languageconst.Delete.tr),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: manageData.appColors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                        ]),
                      );
                    },
                  );
                },
              ),
              heightY(15.h),
              Text(
                "Videos",
                style: manageData.appTextTheme.fs18Normal,
              ),
              heightY(15.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 150,
                    width: AppServices.screenWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(manageData.appimage.innova),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      child: InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.VideoScreen);
                          },
                          child:
                              SvgPicture.asset(manageData.appsvgimg.playbtn))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
