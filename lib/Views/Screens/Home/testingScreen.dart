import 'package:car_booking_owner/Components/Text_field/Primary_Text_field.dart';
import 'package:car_booking_owner/Components/Text_field/Textfieldwithtitle.dart';
import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Res/Services/app_services.dart';
import 'package:flutter/material.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  final _title = TextEditingController();
  final _price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Primary_txtField(
              title: "_title", controller: _title, hint_txt: "hint"),
          Primary_txtField(
              title: "_price", controller: _price, hint_txt: "hint"),
          Textfieldwithtitle(title: "title", hint: "hint"),
          Textfieldwithtitle(title: "title", hint: "hint"),
          Textfieldwithtitle(title: "title", hint: "hint"),
          heightY(50),
          TextButton(
              onPressed: () {
                // FirebaseController().addNewProduct(generateData());
              },
              child: Text("data"))
        ],
      ),
    );
  }

  Car_model generateData() {
    return Car_model(
        title: _title.text, price: double.tryParse(_price.text) ?? 0.0);
  }
}
