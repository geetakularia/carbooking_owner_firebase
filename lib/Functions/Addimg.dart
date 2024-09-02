import 'dart:io';

import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';

final storage = FirebaseStorage.instance;
final firestore = FirebaseFirestore.instance;
/*****************************firebase storage********************* */
//**************** */ Uploade
Future<String> uploadeImage(File file) async {
  String id = DateTime.now().microsecondsSinceEpoch.toString() +
      file.path.split("/").last;
  final reference = await storage.ref().child("media/$id");
  await reference.putFile(file);
  return await reference.getDownloadURL();
}

//**************** */ UpDate
Future<String> upDateImage(String url, File file) async {
  final reference = await storage.refFromURL(url);
  await reference.putFile(file);
  return await reference.getDownloadURL();
}

//*************** */image delete
Future<void> deleteImg(
  Usermodel model,
) async {
  final controllerdata = Get.find<UserController>();
  final reference = await storage.refFromURL(model.image);
  await reference.delete().then((value) {
    manageData.api.userdoc(model.id).update({"image": ""}).then((value) {
      controllerdata
          .setuserdata(model.copywith(image: "") as DataResponse<Usermodel>);
      // getxdata.set_user_basic_data(model.copyWith(image: ""));
    });
  });
}
