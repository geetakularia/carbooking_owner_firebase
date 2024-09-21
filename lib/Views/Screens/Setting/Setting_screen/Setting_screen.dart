import 'package:car_booking_owner/Components/Dialog/logout_dialog.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../Components/AppTiles/Profiletile.dart';

class Setting_screen extends StatelessWidget {
  const Setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.find<UserController>();
    var manageData2 = manageData;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.sp),
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: usercontroller.userdata.data!.image!.isEmpty
                    ? Image.asset(
                        manageData2.appimage.accountcar,
                        width: AppServices.screenWidth(context),
                        height: 150.h,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        usercontroller.userdata.data!.image!,
                        height: 150,
                        fit: BoxFit.cover,
                        width: AppServices.screenWidth(context),
                      ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: manageData.appColors.gray.withOpacity(0.6),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesName.profile);
                    },
                    child: SvgPicture.asset(
                      manageData.appsvgimg.edit,
                      // ignore: deprecated_member_use
                      color: manageData.appColors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 13,
                child: Column(
                  children: [
                    Text(
                      usercontroller.userdata.data!.name.toString(),
                      style: manageData.appTextTheme.fs24Normal
                          .copyWith(color: manageData.appColors.white),
                    ),
                    Text(
                      usercontroller.userdata.data!.phonenumber
                              .toString()
                              .isEmpty
                          ? "+91 1111111111"
                          : usercontroller.userdata.data!.phonenumber
                              .toString(),
                      style: manageData.appTextTheme.fs16Normal
                          .copyWith(color: manageData.appColors.white),
                    ),
                  ],
                ),
              ),
            ]),
            heightY(15.h),
            Text(
              languageconst.general.tr,
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.primary),
            ),
            heightY(10.h),
            Divider(
              thickness: 1,
            ),
            heightY(10.h),
            ...List.generate(
              Generaldata.categoriesData.length,
              (index) => AccountTile(
                  txt: Generaldata.categoriesData[index].title.tr,
                  img: Generaldata.categoriesData[index].icon,
                  onpressed: () {
                    pushto(Generaldata.categoriesData[index].id);
                  }),
            ),
            heightY(10.h),
            Text(
              languageconst.settingsPrivacy.tr,
              style: manageData.appTextTheme.fs16Normal
                  .copyWith(color: manageData.appColors.primary),
            ),
            heightY(10.h),
            Divider(
              thickness: 1,
            ),
            ...List.generate(
              Settingdata.categoriesData.length,
              (index) => AccountTile(
                  txt: Settingdata.categoriesData[index].title.tr,
                  img: Settingdata.categoriesData[index].icon,
                  onpressed: () {
                    pushtosetting(Settingdata.categoriesData[index].id);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

pushto(String id) {
  switch (id) {
    case "Profile":
      return Get.toNamed("/profile");

    case "Bookings":
      return Get.offAll(BottomScreen(
        currentIndex: 1,
      ));
    case "Transaction":
      return Get.toNamed("/transactions");
    case "Notifications":
      return Get.toNamed("/notificationsetting");
    case "Language":
      return Get.toNamed("/Language");
    case "Coupon":
      return Get.toNamed("/coupon");
    case "offer":
      return Get.toNamed("/offer");

    default:
  }
}

pushtosetting(String id) {
  switch (id) {
    case "Payment":
      return Get.toNamed("/paymentmethod");
    case "Privacy":
      return Get.toNamed("/privacypolicy");
    case "Terms":
      return Get.toNamed("/termsandcondition");
    case "FAQ":
      return Get.toNamed("/faq");
    case "Help":
      return Get.toNamed("/helpsupport");
    case "Logout":
      return Get.dialog(GetBuilder<UserController>(
        builder: (controller) => Logout_dialog(
            onpressed_No: () {
              Get.back();
            },
            onpressed_Yes: () async {
              await controller.logout();
            },
            image: manageData.appimage.logout,
            title: languageconst.confirmLogout.tr,
            subtitle: languageconst.configuringSerialNumberPleaseWait.tr),
      ));

    default:
  }
}
