import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Text_field/Textfieldwithtitle.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:car_booking_owner/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestingScreen extends StatefulWidget {
  TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  final _title = TextEditingController();

  final _price = TextEditingController();

  // final FirebaseController controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FirebaseController>();
    //  print("object=-=-=-=-=-=-=-=-=-=");
    // print("-=-=-=-=-${FirebaseController().getallcars[0]}-=--=-=-");
    // print("-=-=-=-=-${FirebaseController().getallcars.length}-=--=-=-");
    return Scaffold(
      body: ListView(
        children: [
          Primary_txtField(
              title: "_title", controller: _title, hint_txt: "hint"),
          Primary_txtField(
              title: "_price", controller: _price, hint_txt: "hint"),
          Textfieldwithtitle(title: "title", hint: "hint"),
          // Textfieldwithtitle(title: "title", hint: "hint"),
          // Textfieldwithtitle(title: "title", hint: "hint"),
          heightY(50),
          TextButton(
              onPressed: () {
                FirebaseController().user_delete();
              },
              child: Text("delete")),
          TextButton(
              onPressed: () {
                FirebaseController().addNewProduct(generateData());
              },
              child: Text("data")),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.getallcars.length,
            itemBuilder: (context, i) {
              final data = controller.getallcars[i];
              return Column(
                children: [
                  Text(
                    data.title ??
                        "No Title", // Assuming title might be nullable
                    style: TextStyle(color: manageData.appColors.black),
                  ),
                  Text(
                    "shgsdaj", // Assuming title might be nullable
                    style: TextStyle(color: manageData.appColors.black),
                  ),
                  Text(
                    data.price.toString(),
                    // Assuming title might be nullable
                    style: TextStyle(color: manageData.appColors.black),
                  ),
                ],
              );
            },
          ),

          heightY(50),
          // heightY(50),
          // TextButton(
          //     onPressed: () {
          //       // FirebaseController().user_delete();
          //     },
          //     child: Text("delete")),
        ],
      ),
    );
  }

  Car_model generateData() {
    return Car_model(
        title: _title.text, price: double.tryParse(_price.text) ?? 0.0);
  }
}
