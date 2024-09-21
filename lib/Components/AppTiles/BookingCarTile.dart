import 'package:car_booking_owner/Components/CarPartTextIcon.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/BookingCarModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookingsCarTile extends StatelessWidget {
  BookingModel model;
  Function onpressed;
  BookingsCarTile({super.key, required this.model, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onpressed();
       
      },
      child: Stack(
        children: [
          Container(
            width: AppServices.screenWidth(context),
            height: AppServices.screenHeight(context) * 0.24,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(model.cars!.first.image!.first),
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          Container(
            // width: AppServices.screenWidth(context),
            // height: AppServices.screenHeight(context) * 0.24,
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 21),
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 13.h),
                        // height: AppServices.screenHeight(context) * 0.188,
                        decoration: BoxDecoration(
                          color: manageData.appColors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CarPartTextIcon(
                              title: model.cars!.first.fuel ?? "",
                              iconpath: manageData.appsvgimg.petrol,
                            ),
                            heightY(10.h),
                            CarPartTextIcon(
                              title: model.cars!.first.transmission ?? "",
                              iconpath: manageData.appsvgimg.gear,
                            ),
                            heightY(10.h),
                            CarPartTextIcon(
                              title: model.cars!.first.seatingcapacity ?? "",
                              iconpath: manageData.appsvgimg.seat,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: manageData.appColors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14.r),
                            bottomLeft: Radius.circular(14.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              model.bookingID ?? "",
                              style: manageData.appTextTheme.fs16Bold.copyWith(
                                color: manageData.appColors.white,
                              ),
                            ),
                            Text(
                              languageconst.bookingID.tr,
                              style:
                                  manageData.appTextTheme.fs12Normal.copyWith(
                                color: manageData.appColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "${model.amount}",
                          style: manageData.appTextTheme.fs24Bold.copyWith(
                            color: manageData.appColors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "/${model.cars!.first.createpackagedata!.first.packagetype}",
                              style: manageData.appTextTheme.fs14Normal,
                            ),
                          ],
                        ),
                      ).paddingOnly(left: 21),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: manageData.appColors.lightgreen,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                          ),
                        ),
                        child: Text(
                          languageconst.seeDetails.tr,
                          style: manageData.appTextTheme.fs16Normal.copyWith(
                            color: manageData.appColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
