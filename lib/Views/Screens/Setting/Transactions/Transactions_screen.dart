import 'package:car_booking_owner/Components/Dialog/Transactionid_dialog.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Usertile_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Transactions_screen extends StatefulWidget {
  const Transactions_screen({super.key});

  @override
  State<Transactions_screen> createState() => _Transactions_screenState();
}

class _Transactions_screenState extends State<Transactions_screen> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController datecontrollrs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          languageconst.Transaction.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightY(15.h),
            Row(
              children: [
                Expanded(
                    child: Primary_txtField(
                        hint_txt: languageconst.searchForMessages.tr)),
                widthX(20.w),
                SizedBox(
                  height: 51.h,
                  child: PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0.r),
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    icon: Container(
                      height: 70.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          color: manageData.appColors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Icon(
                        Icons.swap_vert,
                        color: manageData.appColors.primary,
                      ),
                    ),
                    color: Colors.white,
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: "Latest",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(languageconst.Latest.tr),
                              SvgPicture.asset(
                                manageData.appsvgimg.payment,
                                color: manageData.appColors.primary,
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Older",
                          child: Text(languageconst.Older.tr),
                        ),
                      ];
                    },
                  ),
                ),
                widthX(10.w),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2015),
                        lastDate: selectedDate);
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        datecontrollrs.text =
                            "${picked.toLocal()}".split(" ")[0];
                        selectedDate = picked;
                      });
                    }
                  },
                  child: Container(
                    height: 51.h,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: manageData.appColors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Icon(Icons.calendar_month),
                  ),
                ),
              ],
            ),
            heightY(15.h),
            ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false),
              child: Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => heightY(10.h),
                  itemCount: 12,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => Transactionid_Dialog());
                    },
                    child: Usertile_widget(
                      time: "12/05/03",
                      image: manageData.appimage.innova,
                      title: "Mr Jagdesh",
                      subtitle: "Lorem ipsum dolor sit amet consectetur.",
                      trailingtext: '+ ₹ 1,200',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
