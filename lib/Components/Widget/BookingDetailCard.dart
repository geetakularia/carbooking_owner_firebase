import 'package:car_booking_owner/Components/CarPartTextIcon.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookingDetailCard extends StatelessWidget {
  String image;
  String carname, year, rate, offer, fuel, transmission, seat;
  BookingDetailCard(
      {super.key,
      required this.image,
      required this.carname,
      required this.year,
      required this.rate,
      required this.offer,
      required this.fuel,
      required this.seat,
      required this.transmission});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              // width: 80,
              decoration: BoxDecoration(
                color: manageData.appColors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              padding: EdgeInsets.only(
                  left: 5.sp, right: 5.sp, top: 37.sp, bottom: 37.sp),
              child: Image.asset(
                image,
              ),
            ),
            widthX(5.w),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                decoration: BoxDecoration(
                  color: manageData.appColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            carname,
                            style: manageData.appTextTheme.fs20Normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            year,
                            style: manageData.appTextTheme.fs16Normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    heightY(5.h),
                    Row(
                      children: [
                        CarPartTextIcon(
                            title: fuel,
                            iconpath: manageData.appsvgimg.petrol,
                            svgclr: manageData.appColors.primary,
                            style: manageData.appTextTheme.fs10Normal
                                .copyWith(color: manageData.appColors.black)),
                        widthX(10.w),
                        CarPartTextIcon(
                            title: transmission,
                            iconpath: manageData.appsvgimg.gear,
                            svgclr: manageData.appColors.primary,
                            style: manageData.appTextTheme.fs10Normal
                                .copyWith(color: manageData.appColors.black)),
                        widthX(10.w),
                        CarPartTextIcon(
                            title: "$seat ${languageconst.seats.tr}",
                            iconpath: manageData.appsvgimg.seat,
                            svgclr: manageData.appColors.primary,
                            style: manageData.appTextTheme.fs10Normal
                                .copyWith(color: manageData.appColors.black)),
                      ],
                    ),
                    heightY(5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$rate/",
                          style: manageData.appTextTheme.fs18Normal,
                        ),
                        Text(
                          languageconst.day.tr,
                          style: manageData.appTextTheme.fs12Normal,
                        ),
                        Text(
                          offer,
                          style: manageData.appTextTheme.fs12Normal,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
