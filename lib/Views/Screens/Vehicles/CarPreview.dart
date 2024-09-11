import 'package:car_booking_owner/Components/AppTiles/RentalCars.dart';
import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/UploadDialog.dart';
import 'package:car_booking_owner/Components/Dialog/logout_dialog.dart';
import 'package:car_booking_owner/Components/Widget/RowColumn_widget.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarPreviewScreen extends StatefulWidget {
  CarPreviewScreen({super.key});

  @override
  State<CarPreviewScreen> createState() => _CarPreviewScreenState();
}

class _CarPreviewScreenState extends State<CarPreviewScreen> {
  int currentindex = 0;
  final controllerdata = Get.find<FirebaseController>();

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments["car_id"];
    // print("===================");
    // print(id);
    // print("===================");
    final dataId = controllerdata.getallcars
        .firstWhere((e) => e.car_id == id, orElse: () => Car_model());
    // print(
    //     "-=-=-=-=-=-=-=-=-=-=-=-=${dataId.car_id}-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.dialog(
                    barrierDismissible: false,
                    Logout_dialog(
                      image: manageData.appimage.delete,
                      onpressed_No: () {
                        Get.back();
                      },
                      onpressed_Yes: () {},
                      title: languageconst.confirmDeleteVehicle.tr,
                      subtitle: languageconst.deleteWarningPolicy.tr,
                    ));
              },
              child: Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                    color: manageData.appColors.gray.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Icon(Icons.delete_outline_outlined),
              ),
            ),
            widthX(17.w),
            PrimaryButton(
                title: languageconst.edit.tr,
                isExpanded: true,
                onPressed: () {
                  Get.toNamed(RoutesName.EditVehiclesScreen,
                      arguments: {"car_id": dataId.car_id});
                })
          ],
        ),
      ),
      body: SafeArea(
          child: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightY(15.h),
                    Stack(
                      children: [
                        ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              dataId.image!.first,
                              height: 200.h,
                              width: AppServices.screenWidth(context),
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                            right: 0,
                            top: 13,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 11.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                  color: dataId.carstatus == "Available"
                                      ? manageData.appColors.green
                                      : manageData.appColors.red,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(5))),
                              child: Text(dataId.carstatus.toString(),
                                  style: manageData.appTextTheme.fs12Normal
                                      .copyWith(
                                          color: manageData.appColors.white)),
                            )),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // shape: BoxShape.circle,
                                      color: manageData.appColors.black),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: manageData.appColors.white,
                                  )),
                            ))
                      ],
                    ),
                    heightY(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: dataId.carmodel,
                              style: manageData.appTextTheme.fs24Normal
                                  .copyWith(color: manageData.appColors.black)),
                          TextSpan(
                              text: " ( ${dataId.manufactureyear} ) ",
                              style: manageData.appTextTheme.fs16Normal
                                  .copyWith(color: manageData.appColors.black))
                        ])),
                        /************** image and video **********************************************************/
                        InkWell(
                          onTap: () {
                            Get.dialog(
                                barrierDismissible: false,
                                Dialog(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: UploadDialog(
                                    isshowcheck: true,
                                    onpressed: () {},
                                  ),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                                color: manageData.appColors.primary,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: SvgPicture.asset(
                                manageData.appsvgimg.download_icon),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "4.0",
                          style: manageData.appTextTheme.fs16Normal
                              .copyWith(color: manageData.appColors.gray),
                        ),
                        widthX(6.w),
                        RatingBar.readOnly(
                          size: 15,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          initialRating: 3,
                          maxRating: 5,
                        ),
                        widthX(6.w),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "1.8K",
                              style: manageData.appTextTheme.fs16Normal
                                  .copyWith(color: manageData.appColors.black)),
                          TextSpan(
                              text: languageconst.reviews.tr,
                              style: manageData.appTextTheme.fs12Normal
                                  .copyWith(color: manageData.appColors.black))
                        ])),
                      ],
                    ),
                    heightY(15.h),
                    Text(
                      "${languageconst.priceRate.tr} (₹) ",
                      style: manageData.appTextTheme.fs14Normal,
                    ),
                  ],
                ),
              ),
              heightY(15.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: manageData.appColors.primary,
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(18))),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "₹${dataId.createpackagedata!.first.ammount} ",
                      style: manageData.appTextTheme.fs20Medium),
                  TextSpan(
                      text: languageconst.day.tr,
                      style: manageData.appTextTheme.fs20Normal)
                ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 1,
                    ),
                    heightY(10.h),
                    Text(
                      languageconst.introduction.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    heightY(15.h),
                    Text(
                      dataId.description.toString(),
                      style: manageData.appTextTheme.fs14Normal
                          .copyWith(color: manageData.appColors.gray),
                    ),
                    heightY(15.h),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 10.h, top: 20.h, right: 10.w, left: 10.w),
                      width: AppServices.screenWidth(context),
                      decoration: BoxDecoration(
                        color: manageData.appColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutesName.PhotovideoScreen,
                                  arguments: {"car_id": dataId});
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.translate(
                                  offset: Offset(0, -12),
                                  child: Container(
                                    height: 100,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: manageData.appColors.lightgray,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(0, -6),
                                  child: Container(
                                    height: 100,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: manageData.appColors.gray
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    // color: Colors.black,
                                    image: DecorationImage(
                                      image:
                                          AssetImage(manageData.appimage.bmw),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          widthX(10.w),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                RoutesName.PhotovideoScreen,
                                arguments: {"car_id": dataId},
                              );
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.translate(
                                  offset: Offset(0, -12),
                                  child: Container(
                                    height: 100,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: manageData.appColors.lightgray,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(0, -6),
                                  child: Container(
                                    height: 100,
                                    width: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: manageData.appColors.gray
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    // color: Colors.black,
                                    image: DecorationImage(
                                      image: AssetImage(manageData.appimage
                                          .bmw), // Replace with your image URL
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    child: SvgPicture.asset(
                                        manageData.appsvgimg.playbtn)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightY(15.h),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: manageData.appColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            languageconst.carDetails.tr,
                            style: manageData.appTextTheme.fs14Normal,
                          ),
                          heightY(10.h),
                          Divider(
                            thickness: 1,
                          ),
                          heightY(10.h),
                          RowColumn_Widget(
                              firsttxt: languageconst.carMake.tr,
                              secondtxt: dataId.companyname.toString()),
                          heightY(15.h),
                          RowColumn_Widget(
                              firsttxt: languageconst.transmission.tr,
                              secondtxt: dataId.transmission.toString()),
                          heightY(15.h),
                          RowColumn_Widget(
                              firsttxt: languageconst.color.tr,
                              secondtxt: "red"),
                          heightY(15.h),
                          RowColumn_Widget(
                              firsttxt: languageconst.licensePlateNo.tr,
                              secondtxt: dataId.platenumber.toString()),
                          heightY(15.h),
                          RowColumn_Widget(
                              firsttxt: languageconst.seatingCapacity.tr,
                              secondtxt:
                                  "${dataId.seatingcapacity.toString()} ${languageconst.seats.tr}"),
                        ],
                      ),
                    ),
                    heightY(10.h),
                    Divider(
                      thickness: 1,
                    ),
                    heightY(10.h),
                    Text(
                      languageconst.similarVehicles.tr,
                      style: manageData.appTextTheme.fs16Normal,
                    ),
                    heightY(15.h),
                    AspectRatio(
                      aspectRatio: 1.8,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        separatorBuilder: (context, index) => widthX(10.w),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controllerdata.getallcars.length,
                        itemBuilder: (context, index) {
                          final data = controllerdata.getallcars[index];
                          return Container(
                              width: AppServices.screenWidth(context) * 0.52,
                              child: RentalCarTile(
                                onpressed: () {},
                                model: data,
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
