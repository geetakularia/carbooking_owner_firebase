import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/Primarydialog.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/AuthCommonWidget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Utils/app_validators.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreatePassword_Screen extends StatefulWidget {
  const CreatePassword_Screen({super.key});

  @override
  State<CreatePassword_Screen> createState() => _CreatePassword_ScreenState();
}

class _CreatePassword_ScreenState extends State<CreatePassword_Screen> {
  final _formkey = GlobalKey<FormState>();
  bool isvisible = true;

  final _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final font = manageData.appTextTheme;
    final clr = manageData.appColors;
    final stylesheet = ConstantSheet.instance;
    return Scaffold(
        body: Form(
      key: _formkey,
      child: AuthCommonWidget(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageconst.createNewPassword.tr,
              style: font.fs24Medium.copyWith(color: clr.white),
            ),
            heightY(20.h),
            Text(
              languageconst.enterNewPassword.tr,
              style: font.fs16Normal.copyWith(color: clr.white),
            ),
            heightY(20.h),
            Text(
              languageconst.newPassword.tr,
              style: font.fs16Normal.copyWith(color: clr.white),
            ),
            heightY(10.h),
            Primary_txtField(hint_txt: "**********"),
            heightY(20.h),
            Text(
              languageconst.confirmPassword.tr,
              style: font.fs16Normal.copyWith(color: clr.white),
            ),
            heightY(10.h),
            Primary_txtField(
              validator: (value) => PasswordValidator().validator(value),
              controller: _passwordcontroller,
              hint_txt: "***********",
              suffixicon: isvisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              obscuretxt: isvisible,
              suffix_onpressed: () {
                setState(() {
                  isvisible = !isvisible;
                });
              },
            ),
            heightY(20.h),
            Row(
              children: [
                PrimaryButton(
                  title: languageconst.save.tr,
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Get.back();
                      Future.delayed(Duration(seconds: 2), () {
                        Get.toNamed(RoutesName.login_screen);
                      });
                      Get.dialog(Primary_dialog(
                          image: stylesheet.appimage.key_img,
                          title: languageconst.passwordChangedSuccessfully.tr,
                          subtitle: languageconst
                              .pleaseWaitRedirectingToLoginPage.tr));
                    }
                  },
                  isExpanded: true,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  valideinput() {
    if (_formkey.currentState!.validate()) {}
  }
}
