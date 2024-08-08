import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/upi_dialog.dart';
import 'package:car_booking_owner/Components/Widget/Paymenttile_widget.dart';
import 'package:car_booking_owner/Localdata/Localdata.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Paymentmethod_screen extends StatefulWidget {
  const Paymentmethod_screen({super.key});

  @override
  State<Paymentmethod_screen> createState() => _Paymentmethod_screenState();
}

class _Paymentmethod_screenState extends State<Paymentmethod_screen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            Expanded(
                child: SecondPrimaryButton(
              icon: Icons.card_travel,
              title: "Add  Card",
              backGroundTransparent: true,
              onPressed: () {
                Get.toNamed("/addbankcard");
              },
            )),
            widthX(10.w),
            Expanded(child: PrimaryButton(title: "Save", onPressed: () {}))
          ],
        ),
      ),
      appBar: AppBar(
        title:
            Text("Payment Methods", style: manageData.appTextTheme.fs24Normal),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              Text(
                "Current Method",
                style: manageData.appTextTheme.fs16Normal,
                textAlign: TextAlign.left,
              ),
              Paymentlisttile_widget(
                bordercolor: manageData.appColors.white,
                onpressed: () {},
                trailingicon: true,
                leadingicon: manageData.appsvgimg.cash,
                subtitle: "Default Method",
                title: "Cash",
              ),
              heightY(10.h),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "Chose your desired payment method for online payments in which you are comfortable or add your cards ",
                style: manageData.appTextTheme.fs14Normal,
              ),
              heightY(10.h),
              ListView.builder(
                itemCount: Paymentmethod_data.categoriesData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Paymentlisttile_widget(
                  onpressed: () {
                    setState(() {
                      currentindex = index;
                      currentindex == 2
                          ? Get.dialog(
                              Upidialog_widget(),
                            )
                          : SizedBox();
                    });
                  },
                  leadingicon: Paymentmethod_data.categoriesData[index]["icon"],
                  title: Paymentmethod_data.categoriesData[index]["tittle"],
                  subtitle: Paymentmethod_data.categoriesData[index]
                      ["subtitle"],
                  bordercolor: currentindex == index
                      ? manageData.appColors.gray
                      : manageData.appColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
