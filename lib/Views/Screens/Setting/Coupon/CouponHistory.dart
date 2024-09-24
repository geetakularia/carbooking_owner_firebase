import 'package:car_booking_owner/Controllers/CouponController.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CouponHistoryScreen extends StatelessWidget {
  CouponHistoryScreen({super.key});
  // final couponcontroller = Get.find<CouponController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Coupon Code History",
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: GetBuilder<CouponController>(
            builder: (controller) {
              return ListView.separated(
                separatorBuilder: (context, index) => heightY(9),
                itemCount: controller.getcoupon.length,
                itemBuilder: (context, index) {
                  final data = controller.getcoupon[index];
                  return Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                manageData.appColors.lightgray.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                        color: manageData.appColors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                controller.deletecouponcode(data.couponId!);
                              },
                              child: Text(
                                "Delete",
                                style: manageData.appTextTheme.fs16Normal
                                    .copyWith(color: manageData.appColors.blue),
                              )),
                        ),
                        Text("Coupon Code"),
                        heightY(5.h),
                        Text(data.couponcode.toString()),
                        heightY(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Allowed Users"),
                                heightY(6.h),
                                Text(data.alloweduser.toString())
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Discount"),
                                heightY(6.h),
                                Text("\u{20B9}${data.discount.toString()}")
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
