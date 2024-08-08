import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Dialog/logout_dialog.dart';
import 'package:car_booking_owner/Components/Widget/BookingDetailCard.dart';
import 'package:car_booking_owner/Components/Widget/RowColumn_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageconst.bookingDetails.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
        actions: [
          Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                decoration: BoxDecoration(
                    color: manageData.appColors.primary,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(18))),
                child: Text(
                  "1hr ${languageconst.ago.tr}",
                  style: manageData.appTextTheme.fs14Normal
                      .copyWith(color: manageData.appColors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: manageData.appColors.white,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Image.asset(manageData.appimage.girlprofile),
                        title: Text(
                          " Mr Rakesh sharma",
                          style: manageData.appTextTheme.fs20Normal,
                        ),
                        subtitle: Text(
                          "rajeshshrr98@gmail.com",
                          style: manageData.appTextTheme.fs16Normal,
                        ),
                        trailing: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                              color: manageData.appColors.lightgray,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.phone,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    heightY(15.h),
                    BookingDetailCard(
                        image: manageData.appimage.lambo,
                        carname: "Mercedes Benz ( 2023 )",
                        year: "year",
                        rate: "1,200",
                        offer: "(5% off)"),
                    heightY(15.h),
                    Divider(thickness: 1),
                    heightY(15.h),
                    Container(
                      width: AppServices.screenWidth(context),
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: manageData.appColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            languageconst.address.tr,
                            style: manageData.appTextTheme.fs14Normal
                                .copyWith(color: manageData.appColors.gray),
                          ),
                          heightY(10.h),
                          Text(
                            "Rishi nagar 90 - S 99 gali 1",
                            style: manageData.appTextTheme.fs16Normal,
                          ),
                          heightY(15.h),
                          Text(
                            languageconst.Destination.tr,
                            style: manageData.appTextTheme.fs14Normal
                                .copyWith(color: manageData.appColors.gray),
                          ),
                          heightY(10.h),
                          Text(
                            "Hansi Gate Sec - 89",
                            style: manageData.appTextTheme.fs16Normal,
                          ),
                        ],
                      ),
                    ),
                    heightY(15.h),
                    Container(
                      width: AppServices.screenWidth(context),
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: manageData.appColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            languageconst.timeAndDate.tr,
                            style: manageData.appTextTheme.fs16Normal,
                          ),
                          heightY(15.h),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    languageconst.time.tr,
                                    style: manageData.appTextTheme.fs14Normal
                                        .copyWith(
                                            color: manageData.appColors.gray),
                                  ),
                                  heightY(5.h),
                                  Text(
                                    "10:00am",
                                    style: manageData.appTextTheme.fs16Normal,
                                  )
                                ],
                              ),
                              widthX(15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    languageconst.Date.tr,
                                    style: manageData.appTextTheme.fs14Normal
                                        .copyWith(
                                            color: manageData.appColors.gray),
                                  ),
                                  heightY(5.h),
                                  Text(
                                    "12/06/24",
                                    style: manageData.appTextTheme.fs16Normal,
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    heightY(10.h),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: manageData.appColors.gray.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  ),
                ],
                color: manageData.appColors.bgclr,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.r),
                    topRight: Radius.circular(22.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // heightY(10.h),
                RowColumn_Widget(
                    firsttxt: languageconst.amount.tr, secondtxt: "₹ 1,200"),
                heightY(11.h),
                RowColumn_Widget(
                    firsttxt: languageconst.modeOfPayment.tr,
                    secondtxt: "Online"),
                heightY(11.h),
                RowColumn_Widget(
                    firsttxt: languageconst.couponCodeApplied.tr,
                    img: manageData.appsvgimg.payment,
                    secondtxt: "-  ₹ 200"),
                heightY(11.h),
                Divider(),
                heightY(11.h),
                Text(
                  languageconst.total.tr,
                  style: manageData.appTextTheme.fs16Normal
                      .copyWith(color: manageData.appColors.gray),
                ),
                Text(
                  "₹ 1000",
                  style: manageData.appTextTheme.fs24Bold,
                ),
                heightY(15.h),
                Row(
                  children: [
                    PrimaryButton(
                        title: languageconst.reject.tr,
                        backGroundTransparent: true,
                        onPressed: () {
                          Get.dialog(
                              barrierDismissible: false,
                              Logout_dialog(
                                image: manageData.appimage.delete,
                                onpressed_No: () {
                                  Get.back();
                                },
                                onpressed_Yes: () {},
                                title: languageconst.confirmRejectBooking.tr,
                                subtitle: languageconst
                                    .notifyingCustomerPleaseWait.tr,
                              ));
                        }),
                    widthX(15.w),
                    PrimaryButton(
                      title: languageconst.accept.tr,
                      onPressed: () {
                        Future.delayed(Duration(seconds: 2), () {
                          Get.back();
                        });
                        Get.dialog(
                            barrierDismissible: false,
                            Primary_dialog(
                                image: manageData.appimage.Successfully,
                                title: languageconst
                                    .bookingSuccessfullyAccepted.tr,
                                subtitle:
                                    languageconst.notifyingCustomerPleaseWait));
                      },
                      isExpanded: true,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
