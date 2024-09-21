import 'dart:io';

import 'package:car_booking_owner/Controllers/CarController.dart';
import 'package:car_booking_owner/Controllers/user_controller.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';

final storage = FirebaseStorage.instance;
final firestore = FirebaseFirestore.instance;
/*****************************firebase storage********************* */
//**************** */ Uploade profile
Future<String> uploadeprofile(File file) async {
  String id = DateTime.now().microsecondsSinceEpoch.toString() +
      file.path.split("/").last;
  final reference = await storage.ref().child("profile/$id");
  await reference.putFile(file);
  return await reference.getDownloadURL();
}

Future<String?> uploadImage(String path, File imageFile) async {
  try {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child(path)
        .child(imageFile.uri.pathSegments.last);
    final uploadTask = storageRef.putFile(imageFile);

    final snapshot = await uploadTask.whenComplete(() => {"image upload "});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print("Image upload failed: $e");
    return null;
  }
}

//**************** */ Uploade profile
Future<String> uploadeofferbanner(File file) async {
  String id = DateTime.now().microsecondsSinceEpoch.toString() +
      file.path.split("/").last;
  final reference = await storage.ref().child("OfferBanner/$id");
  await reference.putFile(file);
  print("===================================");
  return await reference.getDownloadURL();
}

//**************** */ Uploade car image

Future<String> uploadecarimg(File file) async {
  String id = DateTime.now().microsecondsSinceEpoch.toString() +
      file.path.split("/").last;
  final reference = await storage.ref().child("carimg/$id");
  await reference.putFile(file);
  return await reference.getDownloadURL();
}

//**************** */ Uploade car video

Future<String> uploadecarvideo(File file) async {
  String url = "";
  try {
    String id = DateTime.now().microsecondsSinceEpoch.toString() +
        file.path.split("/").last;
    final reference = FirebaseStorage.instance.ref().child("videos/$id");

    print("Uploading video with ID: $id");

    await reference.putFile(file);

    url = await reference.getDownloadURL();
    print("Video uploaded successfully. URL: $url");
  } catch (e) {
    print("Error uploading video: $e");
  }
  return url;
}

//**************** */ UpDate
Future<String> upDateImage(String url, File file) async {
  final reference = await storage.refFromURL(url);
  await reference.putFile(file);
  return await reference.getDownloadURL();
}

// *************** */image delete
Future<void> deleteImg(Usermodel model) async {
  final controllerdata = Get.find<UserController>();
  final reference = await storage.refFromURL(model.image!);
  await reference.delete().then((value) {
    manageData.api.userdoc(model.id).update({"image": ""}).then((value) {
      controllerdata
          .setuserdata(model.copyWith(image: "") as DataResponse<Usermodel>);
      // getxdata.set_user_basic_data(model.copyWith(image: ""));
    });
  });
}

Future<void> deletevehicleImg(Car_model model, String imageUrlToDelete) async {
  // print("----------");
  final controllerdata = Get.find<CarController>();
  try {
    // print("-----$imageUrlToDelete-----");
    final reference = await storage.refFromURL(imageUrlToDelete);
    await reference.delete();
    model.image!.removeWhere((e) => e == imageUrlToDelete);
    List<String> updatedImageList = List.from(model.image!);
    updatedImageList.remove(imageUrlToDelete);
    await manageData.api
        .cardoc(model.car_id)
        .update({"image": updatedImageList});
    controllerdata.updateCardata(model);
  } catch (e) {
    print('Error deleting vehicle image: $e ');
  }
}

/*********** add single image add in firebase database */
Future<void> updatevehicleImg(Car_model model, List<String> imageupdata) async {
  final controllerdata = Get.find<CarController>();
  try {
    List<String> updatedImageList = List.from(model.image! ?? []);
    updatedImageList.addAll(imageupdata);
    await manageData.api
        .cardoc(model.car_id)
        .update({"image": updatedImageList});
    Car_model updatedModel = model.copyWith(image: updatedImageList);
    controllerdata.updateCardata(updatedModel);
  } catch (e) {
    print('Error update vehicle image: $e ');
  }
}
