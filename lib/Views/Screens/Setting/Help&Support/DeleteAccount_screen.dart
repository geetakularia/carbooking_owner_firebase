import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Deleteaccount_dialog.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Deleteaccount_Screen extends StatefulWidget {
  const Deleteaccount_Screen({super.key});

  @override
  State<Deleteaccount_Screen> createState() => _Deleteaccount_ScreenState();
}

class _Deleteaccount_ScreenState extends State<Deleteaccount_Screen> {
  int? selectedValue;
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            Expanded(
                child: PrimaryButton(
                    title: languageconst.continueButton.tr,
                    onPressed: () {
                      Get.dialog(Deleteaccount_dialog());
                    }))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.deleteAccount.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              Text(
                languageconst.provideReasonForDeletion.tr,
                style: manageData.appTextTheme.fs14Normal,
              ),
              heightY(15.h),
              ...List.generate(
                DeleteAccountData.deleteAccountData.length,
                (index) => Container(
                  margin: EdgeInsets.only(top: 15.h),
                  decoration: BoxDecoration(
                      color: manageData.appColors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      RadioListTile<int>(
                        activeColor: manageData.appColors.primary,
                        title: Text(
                          DeleteAccountData.deleteAccountData[index]["tittle"],
                          style: manageData.appTextTheme.fs16Normal,
                        ),
                        value: index,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      if (selectedValue == 6 && index == 6)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          child: TextFormField(
                            maxLines: 5,
                            controller: reasonController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: manageData.appColors.bgclr,
                              hintText: languageconst.typeHere.tr,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
