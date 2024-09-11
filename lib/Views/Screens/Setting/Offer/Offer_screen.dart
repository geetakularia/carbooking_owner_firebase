import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/offerContainerWidget.dart';
import 'package:car_booking_owner/Controllers/OfferController.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({super.key});
  final offercontroller = Get.find<OfferController>();
  @override
  Widget build(BuildContext context) {
    // print(
    //     "-=-=--=-=-=-${offercontroller.getofferdata.first.OfferId}-==-======-=-");
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            Expanded(
                child: PrimaryButton(
                    title: languageconst.addoffers.tr,
                    onPressed: () {
                      Get.toNamed("/addoffer");
                      // print(
                      //     "-=--=-=-=-=-=-=-=-=-=-=-=-${offercontroller.getofferdata.first["OfferId"]}--------------------");
                    }))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.Offers.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  languageconst.offercreatedcustomer.tr,
                  style: manageData.appTextTheme.fs14Normal,
                ),
                heightY(15.h),
                ListView.separated(
                  separatorBuilder: (context, index) => heightY(15.h),
                  scrollDirection: Axis.vertical,
                  itemCount: offercontroller.getofferdata.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final data = offercontroller.getofferdata[index];
                    return OffercontainerWidget(
                        model: data,
                        deleteOnPressed: () {},
                        editOnPressed: () {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
