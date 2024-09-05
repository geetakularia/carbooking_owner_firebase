import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/CheckBox/checkBoxListTile.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/AuthCommonWidget.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Utils/app_validators.dart';
import 'package:car_booking_owner/Views/Authentication/SignUpScreen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

RxString initialvalue = "".obs;

class _Login_screenState extends State<Login_screen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    final font = manageData.appTextTheme;
    final clr = manageData.appColors;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: AuthCommonWidget(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    manageData.appsvgimg.splash,
                    width: 100,
                  )),
              heightY(20),
              Text(
                languageconst.welcomeBack.tr,
                style: font.fs18Normal.copyWith(color: clr.white),
              ),
              heightY(5),
              Text(
                languageconst.gladToSeeYouAgain.tr,
                style: font.fs24Medium.copyWith(color: clr.white),
              ),
              heightY(20.h),
              Text(
                languageconst.email.tr,
                style: font.fs14Normal.copyWith(color: clr.white),
              ),
              heightY(10.h),
              Primary_txtField(
                validator: (value) => EmailValidator().validator(value),
                controller: _emailcontroller,
                hint_txt: languageconst.enterUseremail.tr,
                suffixicon: Icons.email,
              ),
              heightY(20.h),
              Text(
                languageconst.password.tr,
                style: font.fs14Normal.copyWith(color: clr.white),
              ),
              heightY(10.h),
              Primary_txtField(
                validator: (value) => PasswordValidator().validator(value),
                controller: _passwordcontroller,
                hint_txt: languageconst.enterYourPassword.tr,
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
              heightY(15.h),
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RoutesName.forget_screen);
                    },
                    child: Text(
                      languageconst.forgotPassword.tr,
                      style: font.fs16Normal.copyWith(color: clr.white),
                    ),
                  )),
              heightY(15.h),
              Obx(
                () => CheckBoxListTile_widget(
                    title: languageconst.rememberMe.tr,
                    style: manageData.appTextTheme.fs16Normal
                        .copyWith(color: manageData.appColors.white),
                    onChanged: (v) {
                      if (initialvalue.isEmpty) {
                        // initialvalue(v);
                      } else {
                        initialvalue("");
                      }
                      print(initialvalue);
                    },
                    value: initialvalue.value),
              ),
              heightY(15.h),
              Row(
                children: [
                  PrimaryButton(
                    title: languageconst.login.tr,
                    onPressed: () {
                      valideinput();
                    },
                    isExpanded: true,
                  ),
                ],
              ),
              heightY(15.h),
              Row(
                children: [
                  PrimaryButton(
                    title: "SignUp",
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    isExpanded: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  valideinput() {
    if (_formkey.currentState!.validate()) {
      // Get.toNamed(RoutesName.BottomScreen);
      UserController()
          .login(_emailcontroller.text.trim(), _passwordcontroller.text.trim());
    }
  }
}
