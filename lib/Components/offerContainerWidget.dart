import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/OfferModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OffercontainerWidget extends StatelessWidget {
  OfferDetails model;
  Function editOnPressed, deleteOnPressed;
  OffercontainerWidget(
      {super.key,
      required this.model,
      required this.deleteOnPressed,
      required this.editOnPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: manageData.appColors.gray.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12.r),
          color: manageData.appColors.white),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title.toString(),
                    style: manageData.appTextTheme.fs20Medium,
                  ),
                  heightY(5.h),
                  Text(
                    model.description.toString(),
                    style: manageData.appTextTheme.fs14Normal
                        .copyWith(color: manageData.appColors.primary),
                  ),
                  heightY(10.h),
                  Text(
                    languageconst.startingat.tr,
                    style: manageData.appTextTheme.fs12Normal,
                  ),
                  RichText(
                      text: TextSpan(
                          style: manageData.appTextTheme.fs12Normal
                              .copyWith(color: Colors.black),
                          children: [
                        TextSpan(
                          text: model.generalDiscount.toString(),
                          style: manageData.appTextTheme.fs16Bold
                              .copyWith(color: Colors.black),
                        ),
                        // TextSpan(
                        //   text: Localdata.homeslideritems[index]["discount"],
                        // )
                      ]))
                ],
              ),
            ),
          ),
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Image.network(
                      height: 170.h,
                      width: AppServices.screenWidth(context) * .5,
                      model.bannerimg!,
                      fit: BoxFit.cover,
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0.r),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      icon: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color:
                                    manageData.appColors.gray.withOpacity(0.2),
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: Offset(0, 0))
                          ],
                          shape: BoxShape.circle,
                          color: manageData.appColors.white,
                        ),
                        child: Icon(
                          Icons.more_vert,
                          color: manageData.appColors.primary,
                        ),
                      ),
                      color: Colors.white,
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              editOnPressed();
                            },
                            value: languageconst.edit.tr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(languageconst.edit.tr),
                                IconButton(
                                    onPressed: () {
                                      // Get.toNamed("/AddOfferDetails");
                                    },
                                    icon: Icon(Icons.edit_outlined))
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              deleteOnPressed();
                            },
                            value: languageconst.Delete.tr,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ])))
        ],
      ),
    );
  }
}
