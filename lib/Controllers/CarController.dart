import 'package:car_booking_owner/Controllers/carFunction.dart';
import 'package:car_booking_owner/Functions/Addimg.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  final _databse = FirebaseFirestore.instance;
  final _function = FirebaseResponseHandler();

  // MAIN ALL CAR DATA
  List<Car_model> _allCars = [];
  List<Car_model> get getallcars => _allCars;

  Car_model? _car;
  Car_model get car => _car!;
  setCar(Car_model model) {
    _car = model;
    update();
  }

  //  UPDATE CAR DATA
  updateCardata(Car_model model) {
    final index =
        _allCars.indexWhere((element) => element.car_id == model.car_id);
    _allCars[index] = model;
    update();
  }

/******************************** updateStatus */
  // updateStatus(bool status) async {
  //   try {
  //     var std = status ? 'Available' : "Unvailable";
  //     await _databse
  //         .collection("Vehicle")
  //         .doc(getallcars.first.car_id)
  //         .update({"carstatus": std});
  //     _allCars.first.carstatus = std;
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

/*********************************** add vehicle */

  Future<String?> addvehicle(Map<String, dynamic> model) async {
    // print("");
    String? vehicleId;
    try {
      print("-=-=-=-step1-=-=-=-=-");
      DocumentReference docRef =
          await _databse.collection("Vehicle").doc(vehicleId);
      final docid = docRef.id;
      // String newDocId = docRef.id;
      // Map<String, dynamic> vehicleData = model.toAddvehicle();
      model["car_id"] = docid;
      // vehicleData['car_id'] = newDocId;
      // Add the document ID
      await _function.postData(docRef, model, RequestType.SET);
      final car = Car_model.fromAddvehicle(FirebaseResponseModel(model, docid));
      _allCars.add(car);
      print("-=-=-=-step2-=-=-=-=-");
      // if (response != null) {
      //   // vehicleId = response.docid;
      //   print("-=-=================================================");
      //   print(vehicleId);
      //   print("-=-==================================================");
      //   _allCars.add(Car_model.fromAddvehicle(response));
      //   print(";;;;;;;;;;;;;${response};;;;;;;;;;;;;;;;;;;;;");
      // }
    } catch (e) {
      print('Error adding vehicle: $e');
      print("-=-=-=----------------------------------------------------------");
    } finally {
      update();
    }

    return vehicleId;
  }

  /****************************************** getcars */
  getCars() async {
    try {
      final response =
          await _function.getDataFromFirebase(_databse.collection("Vehicle"));
      if (response is List) {
        _allCars = response.map((e) => Car_model.fromAddvehicle(e)).toList();
        print("=========----------------------------======");
      }
    } catch (e) {
      print("Error getting cars: ${e}");
    } finally {
      update();
    }
  }

/*************************** update */
  Future<void> updateVehicle(
      String uid, Map<String, dynamic> updatedData) async {
    try {
      FirebaseResponseModel? response = await _function.postData(
          _databse.collection("Vehicle").doc(uid),
          updatedData,
          RequestType.UPDATE);
      if (response != null) {
        print('Data successfully updated with ID: ${response.docid}');
      }
     
    } catch (e) {
      print('Error updating vehicle data: $e');
    }
  }

  /**************************** remove from list Vehicle */
  remove_vehicle(String id) {
    _allCars.removeWhere((e) => e.car_id == id);
    update();
  }

  /**************************** delete Vehicle */
  vehicleDelete(String id, List<String> imageUrls) {
    try {
      _databse.collection("Vehicle").doc(id).delete().then(
        (value) async {
          remove_vehicle(id);
          deleteAllImages(imageUrls);
        },
      ).whenComplete(() {
        Get.toNamed(RoutesName.vehicle);
      });
    } catch (e) {
      print('Error Delete vehicle data: $e');
    }
  }
}

// Function to delete a single image from Firebase Storage using its URL
Future<void> deleteImage(String imageUrl) async {
  try {
    // Get a reference to the file from its URL
    final ref = storage.refFromURL(imageUrl);
    // Delete the file
    await ref.delete();

    print('Image deleted successfully: $imageUrl');
  } catch (e) {
    print('Error deleting image: $e');
  }
}

// Function to delete all images in the list from Firebase Storage
Future<void> deleteAllImages(List<String> imageUrls) async {
  for (String url in imageUrls) {
    await deleteImage(url);
  }
  print('All images deleted successfully');
}
