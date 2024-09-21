import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/CheckBox/checkBoxListTile.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/AuthCommonWidget.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Utils/app_validators.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

RxString initialvalue = "".obs;

class _SignupScreenState extends State<SignupScreen> {
  final _namecontroller = TextEditingController();
  final _gmailcontroller = TextEditingController();
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
                languageconst.userName.tr,
                style: font.fs14Normal.copyWith(color: clr.white),
              ),
              heightY(10.h),
              Primary_txtField(
                validator: (value) => TextValidator().validator(value),
                controller: _namecontroller,
                hint_txt: languageconst.enterUserName.tr,
                suffixicon: Icons.person_3_outlined,
              ),
              heightY(10.h),
              Text(
                languageconst.email.tr,
                style: font.fs14Normal.copyWith(color: clr.white),
              ),
              heightY(10.h),
              Primary_txtField(
                validator: (value) => TextValidator().validator(value),
                controller: _gmailcontroller,
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
              Obx(
                () => CheckBoxListTile_widget(
                    title: languageconst.rememberMe.tr,
                    style: manageData.appTextTheme.fs16Normal
                        .copyWith(color: manageData.appColors.white),
                    onChanged: (v) {
                      if (initialvalue.isEmpty) {
                        initialvalue(v);
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
                    title: "SignUp",
                    onPressed: () {
                      valideinput();
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
      final modeldata = Usermodel(
          name: _namecontroller.text.trim(),
          email: _gmailcontroller.text.trim());
      UserController().signup({
        "userdata": modeldata.tomap(),
        "password": _passwordcontroller.text.trim()
      });
    }
  }
}
