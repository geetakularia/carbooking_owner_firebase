import 'package:car_booking_owner/Components/CarPartTextIcon.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RentalCarTile extends StatelessWidget {
  Car_model model;
  Function onpressed;
  RentalCarTile({super.key, required this.model, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    // final carcontroller = Get.find<FirebaseController>();

    return InkWell(
      onTap: () {
        onpressed();
      },
      child: Stack(
        children: [
          Container(
            height: AppServices.screenHeight(context) * 0.32,
            width: AppServices.screenWidth(context) * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(model.image!.first)),
            ),
          ),
          Container(
            // height: AppServices.screenHeight(context) * 0.32,
            // width: AppServices.screenWidth(context) * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  manageData.appColors.black.withOpacity(0.2),
                  manageData.appColors.black.withOpacity(0.4),
                  manageData.appColors.black,
                ],
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CarPartTextIcon(
                      title: model.fuel.toString(),
                      iconpath: manageData.appsvgimg.petrol,
                    ),
                    SizedBox(width: 5.w),
                    CarPartTextIcon(
                      title: model.transmission.toString(),
                      iconpath: manageData.appsvgimg.gear,
                    ),
                    SizedBox(width: 5.w),
                    CarPartTextIcon(
                      title:
                          "${model.seatingcapacity} ${languageconst.seats.tr}",
                      iconpath: manageData.appsvgimg.seat,
                    ),
                  ],
                ).paddingOnly(right: 5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹${model.createpackagedata!.last.ammount}",
                      style: manageData.appTextTheme.fs18Bold.copyWith(
                        color: manageData.appColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ).paddingOnly(left: 12.w, bottom: 7.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: manageData.appColors.lightgreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.r),
                          bottomRight: Radius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        languageconst.seeDetails.tr,
                        style: manageData.appTextTheme.fs14Normal.copyWith(
                          color: manageData.appColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 12,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: manageData.appColors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.r),
                  topRight: Radius.circular(14.r),
                ),
              ),
              child: Text(
                model.companyname.toString(),
                style: manageData.appTextTheme.fs16Medium.copyWith(
                  color: manageData.appColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
