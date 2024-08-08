import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dropdownbutton/dropdown_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Add_offer_screen extends StatefulWidget {
  const Add_offer_screen({super.key});

  @override
  State<Add_offer_screen> createState() => _Add_offer_screenState();
}

class _Add_offer_screenState extends State<Add_offer_screen> {
  String? _addoffervalue;
  String selectvalue = "";
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
                      if (selectvalue.isNotEmpty) {
                        Get.toNamed("/AddOfferDetails", arguments: selectvalue);
                      }
                    }))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.addoffers.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Text(
              languageconst.selecttypeofferwantcreate.tr,
              style: manageData.appTextTheme.fs14Normal,
            ),
            heightY(15.h),
            Primarydropdownbutton_widget(
              bgclr: manageData.appColors.white,
              hint: languageconst.selectoffertype.tr,
              selectedValue: _addoffervalue,
              dropdownItems: Localdata.addoffer,
              title: languageconst.Offers.tr,
              onChanged: (v) {
                setState(() {
                  selectvalue = v;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
