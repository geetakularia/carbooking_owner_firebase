import 'dart:io';

import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/ImgPicker/ImgPicker.dart';
import 'package:car_booking_owner/Controllers/CarController.dart';
import 'package:car_booking_owner/Functions/Addimg.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
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
  List<File>? imageFiles = [];

  @override
  Widget build(BuildContext context) {
    final carController = Get.find<CarController>();

    final id = Get.arguments["car_id"];
    final dataId = carController.getallcars
        .firstWhere((e) => e.car_id == id, orElse: () => Car_model());
    // print("///////////////////${dataId.car_id}\\\\\\\\\\\\");

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: PrimaryButton(
          title: languageconst.uploadVehicle.tr,
          onPressed: () async {
            if (imageFiles != null) {
              // Upload the selected image to Firebase
              List<String> imageUrl = await uploadImages(imageFiles!);
              // Update the vehicle with the new image
              await updatevehicleImg(dataId, imageUrl);
              Get.dialog(Primary_dialog(
                image: manageData.appimage.vehicle,
                title: languageconst.vehicleAddedSuccessfully.tr,
                subtitle: languageconst.uploadingVehicleListPleaseWait.tr,
              ));
              Get.offAll(BottomScreen(
                currentIndex: 3,
              ));
            } else {
              print("------------------------------------");
              Get.snackbar("Error", "Please select an image to upload.");
              print("------------------------------------");
            }
          },
          isExpanded: true,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Photos",
          style: manageData.appTextTheme.fs18Normal,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => ImagePickBottomsheet(
                          file: (File v) {
                            setState(() {
                              imageFiles!.add(v);
                            });
                          },
                        ));
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
              GetBuilder<CarController>(
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
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(5.r),
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
                                Icons.close,
                                color: manageData.appColors.primary,
                              ),
                            ),
                            color: Colors.white,
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  onTap: () {
                                    // print("===============");
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
              /*********************** */
              imageFiles!.isEmpty
                  ? SizedBox()
                  : Text(
                      "New Photos",
                      style: manageData.appTextTheme.fs18Normal,
                    ),
              imageFiles!.isEmpty ? SizedBox() : heightY(15.h),
              GridView.builder(
                shrinkWrap: true,
                itemCount: imageFiles!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          imageFiles![index],
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              imageFiles!.removeAt(index);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
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
                              Icons.close,
                              color: manageData.appColors.primary,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
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
