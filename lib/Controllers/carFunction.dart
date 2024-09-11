import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler {
  Future<dynamic> getDataFromFirebase(dynamic path) async {
    dynamic response;
    try {
      if (path is CollectionReference) {
        response = await _getDataFromCollection(path);
      } else if (path is DocumentReference) {
        response = await _getDataFromDocumentReference(path);
      } else {
        response = await _getDataFromQuery(path as Query);
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    return response;
  }

  Future<List<FirebaseResponseModel>> _getDataFromCollection(
      CollectionReference reff) async {
    List<FirebaseResponseModel> data = [];
    try {
      final snapshot = await reff.get();
      data = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResonse(e))
          .toList();
    } catch (e) {
      print('Error getting data from collection: $e');
      rethrow;
    }
    return data;
  }

  Future<FirebaseResponseModel?> _getDataFromDocumentReference(
      DocumentReference reff) async {
    FirebaseResponseModel? data;
    try {
      final snapshot = await reff.get();
      data = FirebaseResponseModel.fromResonse(snapshot);
    } catch (e) {
      print('Error getting data from document reference: $e');
      rethrow;
    }
    return data;
  }

  Future<List<FirebaseResponseModel>> _getDataFromQuery(Query reff) async {
    List<FirebaseResponseModel> data = [];
    try {
      final snapshot = await reff.get();
      data = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResonse(e))
          .toList();
    } catch (e) {
      print('Error getting data from query: $e');
      rethrow;
    }
    return data;
  }

  Future<FirebaseResponseModel?> postData(
      dynamic path, Map<String, dynamic> data,
      [RequestType? request]) async {
    try {
      if (path is DocumentReference) {
        if (request == RequestType.SET) {
          await path.set(data);
        } else {
          await path.update(data);
        }
      } else if (path is CollectionReference) {
        final response = await path.add(data);
        return FirebaseResponseModel(data, response.id);
      }
    } catch (e) {
      print('Error posting data: $e');
      rethrow;
    }
    return null;
  }
}

class FirebaseController extends GetxController {
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
      // print("-=-=-=-step2-=-=-=-=-");
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
      // print("-=-=-=----------------------------------------------------------");
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
        // print("=========++++++++++++++======");
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

  /**************************** delete Vehicle */
  vehicleDelete(Car_model model) {
    try {
      _databse.collection("Vehicle").doc(_allCars.first.car_id).delete();
    } catch (e) {
      print('Error Delete vehicle data: $e');
    }
  }
}
