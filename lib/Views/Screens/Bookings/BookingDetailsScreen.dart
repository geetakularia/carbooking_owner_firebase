import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Dialog/logout_dialog.dart';
import 'package:car_booking_owner/Components/Widget/BookingDetailCard.dart';
import 'package:car_booking_owner/Components/Widget/RowColumn_widget.dart';
import 'package:car_booking_owner/Controllers/BookingController.dart';
import 'package:car_booking_owner/Functions/UserSpot.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/BookingCarModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({super.key});
  final fn = MyFunctions();
  final id = Get.arguments["bookingID"];
  final bookingcontroller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    final dataId = bookingcontroller.getbookingcar
        .firstWhere((e) => e.bookingID == id, orElse: () => BookingModel());

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
                        leading: dataId.user!.image!.isEmpty
                            ? Container(
                                padding: EdgeInsets.all(9.sp),
                                decoration: BoxDecoration(
                                    color: manageData.appColors.gray,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.person,
                                  color: manageData.appColors.white,
                                  size: 30,
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  dataId.user!.image!,
                                  width: 52,
                                  fit: BoxFit.cover,
                                )),
                        title: Text(
                          dataId.user!.name.toString(),
                          style: manageData.appTextTheme.fs20Normal,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          dataId.user!.email.toString(),
                          style: manageData.appTextTheme.fs16Normal,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        trailing: InkWell(
                          onTap: () {
                            fn.launchPhone(dataId.user!.phonenumber.toString());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
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
                    ),
                    heightY(15.h),
                    BookingDetailCard(
                        image: manageData.appimage.lambo,
                        carname:
                            "${dataId.cars!.first.companyname.toString()} (${dataId.cars!.first.manufactureyear.toString()})",
                        year: "year",
                        fuel: dataId.cars!.first.fuel.toString(),
                        seat: dataId.cars!.first.seatingcapacity.toString(),
                        transmission:
                            dataId.cars!.first.transmission.toString(),
                        rate: dataId.amount.toString(),
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
                            dataId.address.toString(),
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
                            dataId.destination.toString(),
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
                                    DateFormat('HH:mm a')
                                        .format(DateTime.parse(dataId.time!)),
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
                                    DateFormat('dd/MM/yy')
                                        .format(DateTime.parse(dataId.time!)),
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
                    firsttxt: languageconst.amount.tr,
                    secondtxt: "₹ ${dataId.amount.toString()}"),
                heightY(11.h),
                RowColumn_Widget(
                    firsttxt: languageconst.modeOfPayment.tr,
                    secondtxt: dataId.paymentType.toString()),
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
                  "₹ ${dataId.amount.toString()}",
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
                                onpressed_Yes: () {
                                  final data = BookingModel(
                                      bookingState: BookingState.REJECTED);
                                  bookingcontroller.updateBooking(
                                      dataId.id!, data.tomap());
                                  Get.offAll(BottomScreen(
                                    currentIndex: 1,
                                  ));
                                },
                                title: languageconst.confirmRejectBooking.tr,
                                subtitle: languageconst
                                    .notifyingCustomerPleaseWait.tr,
                              ));
                        }),
                    widthX(15.w),
                    /************************** accept booking */
                    PrimaryButton(
                      title: languageconst.accept.tr,
                      onPressed: () {
                        Future.delayed(Duration(seconds: 2), () {
                          final data =
                              BookingModel(bookingState: BookingState.ACCEPT);
                          bookingcontroller.updateBooking(
                              dataId.id!, data.tomap());
                          Get.offAll(BottomScreen(
                            currentIndex: 1,
                          ));
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
