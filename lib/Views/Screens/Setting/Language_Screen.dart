import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Icon_container_widget.dart';
import 'package:car_booking_owner/I18n/LanguageController.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Language_screen extends StatefulWidget {
  const Language_screen({super.key});

  @override
  State<Language_screen> createState() => _Language_screenState();
}

class _Language_screenState extends State<Language_screen> {
  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageconst.language.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Primary_txtField(
                    hint_txt: languageconst.searchForLanguages.tr,
                  ),
                ),
                widthX(20.w),
                Iconcontainer(
                  onpressed: () {},
                  icon: Icons.search,
                ),
              ],
            ),
            heightY(25.h),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => heightY(15.h),
                itemBuilder: (context, index) {
                  final language = Languages.language[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: manageData.appColors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: RadioListTile(
                      value: language,
                      groupValue: languageController.selectedLanguage,
                      onChanged: (v) {
                        languageController.setLanguage(v!);
                      },
                      title: Text(language.languagename,
                          style: manageData.appTextTheme.fs16Normal),
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: manageData.appColors.black,
                    ),
                  );
                },
                itemCount: Languages.language.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
