import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Controllers/CouponController.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/CouponCodeModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Coupon_scrren extends StatefulWidget {
  const Coupon_scrren({super.key});

  @override
  State<Coupon_scrren> createState() => _Coupon_scrrenState();
}

class _Coupon_scrrenState extends State<Coupon_scrren> {
  // String selectedValue = "Select";
  // List<DropdownMenuItem<String>> get dropdownItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     DropdownMenuItem(child: Text("Select"), value: "Select"),
  //     DropdownMenuItem(child: Text("Unselect"), value: "Unselect"),
  //   ];
  //   return menuItems;
  // }
  final _couponcode = TextEditingController();
  final _discount = TextEditingController();
  final _alloweduser = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final couponcontroller = Get.find<CouponController>();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.addCoupon.tr,
              onPressed: () {
                final data = CoupOnCodeModel(
                    alloweduser: int.tryParse(_alloweduser.text.trim()),
                    couponcode: _couponcode.text.trim(),
                    discount: int.tryParse(_discount.text.trim()));
                couponcontroller.addcoupon(data.toMap());
                Get.dialog(Primary_dialog(
                    image: manageData.appimage.coupon,
                    title: languageconst.couponCreatedSuccessfully.tr,
                    subtitle:
                        languageconst.configuringSerialNumberPleaseWait.tr));
                Get.offAll(BottomScreen(
                  currentIndex: 4,
                ));
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.addCouponCode.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                  color: manageData.appColors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(languageconst.addCouponDescription.tr),
                  heightY(15.h),
                  Text(
                    languageconst.couponCode.tr,
                    style: manageData.appTextTheme.fs16Normal
                        .copyWith(color: manageData.appColors.primary),
                  ),
                  heightY(10.h),
                  Primary_txtField(
                    controller: _couponcode,
                    hint_txt: languageconst.enterCodeHere.tr,
                    fillcolor: true,
                  ),
                  heightY(15.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${languageconst.maxDiscount.tr} (₹)",
                              style: manageData.appTextTheme.fs16Normal
                                  .copyWith(
                                      color: manageData.appColors.primary),
                            ),
                            heightY(10.h),
                            Primary_txtField(
                              controller: _discount,
                              hint_txt: "₹00.00",
                              fillcolor: true,
                            ),
                          ],
                        ),
                      ),
                      widthX(10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              languageconst.allowedUses.tr,
                              style: manageData.appTextTheme.fs16Normal
                                  .copyWith(
                                      color: manageData.appColors.primary),
                            ),
                            heightY(12.h),
                            Primary_txtField(
                              controller: _alloweduser,
                              hint_txt: languageconst.enter.tr,
                              fillcolor: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
