import 'dart:io';
import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/ImagePickerWidget.dart';
import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Widget/Icon_container_widget.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/Functions/Addimg.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  @override
  void initState() {
    super.initState();
    _getdata();
  }

  File? imageFile;
  String image = "";
  final _name_controller = TextEditingController();
  final _phn_controller = TextEditingController();
  final _address_controller = TextEditingController();
  final controllerdata = Get.find<UserController>();
  final picker = ImagePicker();
  Future getgalleryimage() async {
    final pickedimage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
    } else {}
  }

  /**********************auto fill textformfield function*********************** */
  _getdata() {
    final controllerdata = Get.find<UserController>();
    _name_controller.text = controllerdata.userdata.data!.username;
    image = controllerdata.userdata.data!.image;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.find<UserController>();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.save.tr,
              onPressed: () async {
                if (imageFile != null) {
                  if (image.isEmpty) {
                    image = await uploadeprofile(imageFile!);
                    //  print("Profil imag ;::::::: ${image}");
                  } else {
                    image = await upDateImage(image, imageFile!);
                  }
                }

                Usermodel updatedUserModel = controllerdata.userdata.data!
                    .copywith(
                        image: image,
                        username: _name_controller.text.trim(),
                        phonenumber: _phn_controller.text.trim(),
                        address: _address_controller.text.trim());
                DataResponse<Usermodel> updatedUserResponse =
                    DataResponse.completed(updatedUserModel);
                controllerdata.user_update(updatedUserResponse);
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.profile.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please check and add your necessary details for your booking Profile",
                  style: manageData.appTextTheme.fs14Normal,
                ),
                heightY(20.h),
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: imageFile == null
                              ? (image.isEmpty
                                  ? Container(
                                      padding: EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                          color: manageData.appColors.gray,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.person,
                                        color: manageData.appColors.white,
                                        size: 90,
                                      ))
                                  : Image.network(
                                      image,
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ))
                              : Image.file(
                                  File(imageFile!.path),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                )),
                      Positioned(
                        bottom: 3,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // showModalBottomSheet(
                            //     context: context,
                            //     builder: (context) =>
                            //         imagePickerbottomsheet(context, (v) {
                            //           if (v.path.isNotEmpty) {
                            //             setState(() {
                            //               imageFile = v;
                            //     });
                            //   } else {
                            //     null;
                            //   }
                            // }, () {
                            //   // App_service(context).popTo();
                            //   setState(() {
                            //     imageFile = null;
                            //   });
                            // },
                            // )
                            // );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: manageData.appColors.white,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              color: manageData.appColors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                heightY(10.h),
                Text(
                  "Name ",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Primary_txtField(
                  hint_txt: "Mr Joe leo",
                  controller: _name_controller,
                ),
                heightY(20.h),
                Text(
                  "Email ",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primary_txtField(
                          hint_txt: usercontroller.userdata.data!.email),
                    ),
                    widthX(20.w),
                    Iconcontainer(icon: Icons.lock_outline, onpressed: () {}),
                  ],
                ),
                heightY(20.h),
                Text(
                  "Mobile ",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primary_txtField(
                        hint_txt: "+91 85641 86451",
                        controller: _phn_controller,
                      ),
                    ),
                    widthX(20.w),
                    Iconcontainer(icon: Icons.phone_outlined, onpressed: () {}),
                  ],
                ),
                heightY(20.h),
                Text(
                  "Address",
                  style: manageData.appTextTheme.fs16Normal,
                ),
                heightY(10.h),
                Row(
                  children: [
                    Expanded(
                      child: Primary_txtField(
                          controller: _address_controller,
                          hint_txt: "Rishi nagar 90 - S 99 gali 1"),
                    ),
                    widthX(20.w),
                    Iconcontainer(
                      icon: Icons.location_on_outlined,
                      onpressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
