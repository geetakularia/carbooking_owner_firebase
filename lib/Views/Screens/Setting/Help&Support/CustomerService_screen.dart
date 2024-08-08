import 'package:car_booking_owner/Components/Widget/Custom_chatmessage_widget.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Models/message_model.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerService_screen extends StatefulWidget {
  const CustomerService_screen({super.key});

  @override
  State<CustomerService_screen> createState() => _CustomerService_screenState();
}

class _CustomerService_screenState extends State<CustomerService_screen> {
  TextEditingController chat_controller = TextEditingController();
  int textformfieldvalue = 0;
  ScrollController _scrollController = ScrollController();

  List<Message_Model> mylist = [];
  FocusNode focusnode = FocusNode();
  String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  bool show = false;
  @override
  void initState() {
    super.initState();
    focusnode.addListener(() {
      if (focusnode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: SvgPicture.asset(
              manageData.appsvgimg.number,
              height: 30.h,
            ),
          )
        ],
        title: Text(
          languageconst.customerServices.tr,
          style: manageData.appTextTheme.fs24Normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: mylist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MessageContain_widget(
                          index: index,
                          message: mylist[index].mostRecentMessage,
                          isSeen: false,
                          isMe: false,
                          time: mylist[index].messageDate,
                          onPress: () {},
                          listLength: mylist.length,
                          type: mylist[index].type,
                        )
                      ],
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                  color: manageData.appColors.black,
                  border: Border.all(color: manageData.appColors.black),
                  borderRadius: BorderRadius.circular(50.r)),
              width: AppServices.screenWidth(context),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          focusnode.unfocus();
                          focusnode.canRequestFocus = false;
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: manageData.appColors.white,
                        )),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: manageData.appColors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(children: [
                        Expanded(
                            child: TextFormField(
                          focusNode: focusnode,
                          controller: chat_controller,
                          maxLines: 5,
                          minLines: 1,
                          onChanged: (value) {
                            setState(() {
                              textformfieldvalue = value.length;
                            });
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Message"),
                        )),
                      ]),
                    ),
                  ),
                  widthX(10.w),
                  Row(
                    children: [
                      SvgPicture.asset(
                        manageData.appsvgimg.attachfile,
                      ),
                      widthX(10.w),
                      GestureDetector(
                        onTap: () {
                          if (chat_controller.text.isNotEmpty) {
                            var now = DateTime.now();
                            var messageitm = Message_Model(
                                chat_controller.text, formatTime(now), '');
                            mylist.add(messageitm);
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 2),
                                curve: Curves.bounceIn);
                            chat_controller.clear();
                            setState(() {});
                          }
                        },
                        child: SvgPicture.asset(
                          manageData.appsvgimg.share,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            show ? emojiSelected() : SizedBox()
          ],
        ),
      ),
    );
  }

  emojiSelected() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        setState(() {
          chat_controller.text = chat_controller.text + emoji.emoji;
        });
      },
    );
  }
}
