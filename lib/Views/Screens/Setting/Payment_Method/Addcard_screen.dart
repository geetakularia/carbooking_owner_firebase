import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Components/Text_field/Primary_Text_field.dart';

class AddBankCard_screen extends StatefulWidget {
  const AddBankCard_screen({super.key});

  @override
  State<AddBankCard_screen> createState() => _AddBankCard_screenState();
}

class _AddBankCard_screenState extends State<AddBankCard_screen> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController datecontrollrs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.addMyCard.tr,
              onPressed: () {
                Future.delayed(Duration(seconds: 2), () {
                  Get.back();
                });
                Get.dialog(Primary_dialog(
                  image: manageData.appimage.addcard,
                  title: languageconst.bankCardAddedSuccessfully.tr,
                  subtitle: languageconst.takingUpRequiredDetailsPleaseWait.tr,
                ));
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
         languageconst.addBankCard.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                    border: Border.all(color: manageData.appColors.gray),
                    borderRadius: BorderRadius.circular(15.r)),
                child: ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(6.sp),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: manageData.appColors.gray),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(manageData.appsvgimg.addcard)),
                    title: Text(
                      languageconst.addNewCard.tr,
                      style: manageData.appTextTheme.fs14Normal,
                    ),
                    subtitle: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      languageconst.streamlineCheckoutProcess.tr,
                      style: manageData.appTextTheme.fs12Normal,
                    ),
                    trailing: SvgPicture.asset(manageData.appsvgimg.wrong)),
              ),
              heightY(15.h),
              Text(
               languageconst.cardNo.tr,
                style: manageData.appTextTheme.fs16Normal,
              ),
              heightY(10.h),
              Primary_txtField(
                hint_txt: "4966 0000 0000 0000",
                suffixicon: Icons.credit_card_outlined,
              ),
              heightY(15.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          languageconst.expiryDate.tr,
                          style: manageData.appTextTheme.fs16Normal
                              .copyWith(color: manageData.appColors.primary),
                        ),
                        heightY(10.h),
                        Primary_txtField(
                          hint_txt: "MM/YY",
                          suffixicon: Icons.calendar_month,
                          suffix_onpressed: () async {
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
                        languageconst.CVV.tr,
                          style: manageData.appTextTheme.fs16Normal
                              .copyWith(color: manageData.appColors.primary),
                        ),
                        heightY(10.h),
                        Primary_txtField(
                          suffixicon: Icons.add_moderator_outlined,
                          hint_txt: "........",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              heightY(15.h),
              Text(
               languageconst.cardholdersName.tr,
                style: manageData.appTextTheme.fs16Normal,
              ),
              heightY(10.h),
              Primary_txtField(
                hint_txt: languageconst.enterCardholdersName.tr,
                suffixicon: Icons.person_2_outlined,
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
