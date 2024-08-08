import 'package:car_booking_owner/Components/Buttons/primary_button.dart';
import 'package:car_booking_owner/Components/Dialog/logout_dialog.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Faq_screen extends StatefulWidget {
  const Faq_screen({super.key});

  @override
  State<Faq_screen> createState() => _Faq_screenState();
}

class _Faq_screenState extends State<Faq_screen> {
  List<Faqitems> _faqitems = [
    Faqitems(
      question: "What is your name",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: true,
    ),
    Faqitems(
      question: "Can we cancel at any time ?",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    ),
    Faqitems(
      question: "Does flow require minimum flow of user’s ?",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    ),
    Faqitems(
      question: "What’s your Refund Policy ?",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    ),
    Faqitems(
      question: "Where are my payment options",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    )
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            PrimaryButton(
              title: languageconst.addquestion.tr,
              onPressed: () {
                Get.toNamed("/addquestion");
              },
              isExpanded: true,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          languageconst.faqs.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              ListView.builder(
                itemCount: _faqitems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = _faqitems[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        color: manageData.appColors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Column(
                      children: [
                        ExpansionTile(
                          leading: Text(
                            "Q ${index + 1} .",
                            style: manageData.appTextTheme.fs16Normal,
                          ),
                          iconColor: manageData.appColors.primary,
                          textColor: manageData.appColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          title: Text(
                            item.question,
                            style: manageData.appTextTheme.fs16Normal,
                          ),
                          trailing: PopupMenuButton(
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
                                Icons.more_vert,
                                color: manageData.appColors.primary,
                                // size: 30,
                              ),
                            ),
                            color: Colors.white,
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  value: "Edit",
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Edit"),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit_outlined))
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: "Delete",
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delete"),
                                      IconButton(
                                        onPressed: () {
                                          Future.delayed(Duration(seconds: 2),
                                              () {
                                            Get.back();
                                          });
                                          Get.dialog(Logout_dialog(
                                            image: manageData.appimage.delete,
                                            onpressed_No: () {},
                                            onpressed_Yes: () {},
                                            title:
                                                "Are you Sure you want to Delete FAQ’s Question",
                                            subtitle:
                                                "please wait we are configuring data form customer’s app",
                                          ));
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: manageData.appColors.red,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                          children: [
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                "Ans",
                                style: manageData.appTextTheme.fs16Normal,
                              ),
                              title: Container(
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                      color: manageData.appColors.bgclr,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Text(
                                    item.answer,
                                    style: manageData.appTextTheme.fs16Normal,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Faqitems {
  final String question;
  final String answer;
  bool isvisible;
  Faqitems(
      {required this.question, required this.answer, this.isvisible = false});
}
