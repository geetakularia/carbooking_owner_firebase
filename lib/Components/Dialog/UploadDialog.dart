import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Components/CheckBox/CheckboxWidget.dart';
import 'package:car_booking_owner/Components/CustomClipper/Close_clipper.dart';
import 'package:car_booking_owner/Components/Widget/Custombackbutton.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadDialog extends StatelessWidget {
  final bool isshowcheck;
  Function onpressed;

  UploadDialog({
    super.key,
    this.isshowcheck = false,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    final styledata = ConstantSheet.instance;
    RxString isselected = "".obs;

    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(alignment: Alignment.topRight, children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    languageconst.upload.tr,
                    style: styledata.appTextTheme.fs24Normal,
                  ),
                  heightY(10.h),
                  isshowcheck
                      ? Obx(
                          () {
                            return Row(
                              children: [
                                CheckboxWidget(
                                  text: languageconst.video.tr,
                                  onSelect: (v) {
                                    if (isselected.isEmpty) {
                                      isselected(v);
                                    } else {
                                      isselected("");
                                    }
                                  },
                                  selected_vlaue: isselected.value,
                                  checkcolor: styledata.appColors.green,
                                ),
                                widthX(20.w),
                                CheckboxWidget(
                                  text: languageconst.photos.tr,
                                  onSelect: (v) {
                                    if (isselected.isEmpty) {
                                      isselected(v);
                                    } else {
                                      isselected("");
                                    }
                                  },
                                  selected_vlaue: isselected.value,
                                  checkcolor: styledata.appColors.green,
                                ),
                              ],
                            );
                          },
                        )
                      : SizedBox(),
                  isshowcheck ? heightY(4.h) : SizedBox(),
                  heightY(15.h),
                  InkWell(
                    onTap: () {
                      onpressed;
                    },
                    child: Container(
                      width: AppServices.screenWidth(context),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 35.h),
                      decoration: BoxDecoration(
                          color: styledata.appColors.lightgray.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        children: [
                          SvgPicture.asset(styledata.appsvgimg.download_icon_2),
                          heightY(10.h),
                          Text(languageconst.uploadimagevideo.tr,
                              style: styledata.appTextTheme.fs16Normal
                                  .copyWith(color: styledata.appColors.gray))
                        ],
                      ),
                    ),
                  ),
                  heightY(15.h),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: languageconst.fileSizeLimitNote.tr,
                            style: styledata.appTextTheme.fs14Normal
                                .copyWith(color: styledata.appColors.gray)),
                        TextSpan(
                            text: "50mb",
                            style: styledata.appTextTheme.fs14Normal
                                .copyWith(color: styledata.appColors.black)),
                        TextSpan(
                            text: languageconst.orless.tr,
                            style: styledata.appTextTheme.fs14Normal
                                .copyWith(color: styledata.appColors.gray)),
                      ])),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ClipPath(
                clipper: CloseClipper(),
                child: CustomBackbutton(),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
