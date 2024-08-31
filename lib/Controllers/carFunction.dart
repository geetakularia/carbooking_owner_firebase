import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler {
  Future<dynamic> getDataFromFirebase(dynamic path) async {
    // ignore: unused_local_variable
    dynamic response;
    try {
      if (path is CollectionReference) {
        response = await _getDataFromCollection(path);
      } else if (path is DocumentReference) {
        response = await _getDataFromDocumentReference(path);
      } else {
        response = await _getDataFromQuery(path as Query);
      }
    } catch (e) {}
  }

  /// collection
  Future<List<FirebaseResponseModel>> _getDataFromCollection(
      CollectionReference reff) async {
    List<FirebaseResponseModel> data = [];
    try {
      final snapshot = await reff.get();
      data = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResonse(e))
          .toList();
    } catch (e) {
      rethrow;
    }
    return data;
  }

  /// DocumentReference
  Future<FirebaseResponseModel?> _getDataFromDocumentReference(
      DocumentReference reff) async {
    FirebaseResponseModel? data;
    try {
      final snapshot = await reff.get();
      data = FirebaseResponseModel.fromResonse(snapshot);
    } catch (e) {
      rethrow;
    }
    return data;
  }

  ///query
  Future<List<FirebaseResponseModel>> _getDataFromQuery(Query reff) async {
    List<FirebaseResponseModel> data = [];
    try {
      final snapshot = await reff.get();
      data = snapshot.docs
          .map(
            (e) => FirebaseResponseModel.fromResonse(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
    return data;
  }

  // post Data
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
      rethrow;
    }
    return null;
  }
}

class FirebaseController extends GetxController {
  final _databse = FirebaseFirestore.instance;
  final _function = FirebaseResponseHandler();
  List<Car_model> _allCars = [];
  List<Car_model> get getallcars => _allCars;
  // user_delete() {
  //   try {
  //     _databse
  //         .collection("MyCars")
  //         .doc("VnFwBDL807XUowNVn34y")
  //         .update({"title": FieldValue.delete()});
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  getCars() async {
    try {
      final response =
          await _function.getDataFromFirebase(_databse.collection("MyCars"));
      if (response is List) {
        _allCars = response.map((e) => Car_model.fromcars(e)).toList();
      }
    } catch (e) {
      print("==================================${e}");
    } finally {
      update();
    }
  }

  // deletekey() async {
  //   await _databse
  //       .collection("addvehicle")
  //       .doc("dQE0sfkwqxpMMTwqW26c")
  //       .update({"companyname": FieldValue.delete()});
  // }

  // addNewProduct(Car_model model) async {
  //   try {
  //     final response = await _function.postData(
  //         _databse.collection("MyCars"), model.toProduct());
  //     if (response != null) {
  //       _allCars.add(Car_model.fromcars(response));
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     update();
  //   }
  // }

  addvehicle(Car_model model) async {
    print("-=-=-=-step1-=-=-=-=-");
    try {
      print("-=-=-=-step2-=-=-=-=-");
      DocumentReference docRef = _databse.collection("addvehicle").doc();
      String newDocId = docRef.id;
      Map<String, dynamic> vehicleData = model.toAddvehicle();
      vehicleData['car_id'] = newDocId; // Add the document ID
      final response = await _function.postData(
          docRef, vehicleData, RequestType.SET) as FirebaseResponseModel;
      print("-=-=-=-=-=-=${response.docid}-==-=-=-=-=");
      if (response.docid.isNotEmpty) {
        _allCars.add(Car_model.fromAddvehicle(response));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

// Example function call to update vehicle data in Firestore
  Future<void> updateVehicle(
      String uid, Map<String, dynamic> updatedData) async {
    try {
      print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
      // Construct the document reference using the UID
      DocumentReference documentRef =
          _databse.collection("addvehicle").doc(uid);
      // Call postData with the document reference, data, and request type
      FirebaseResponseModel? response = await _function.postData(
        documentRef, // Pass the correct document reference
        updatedData, // Data to update
        RequestType.UPDATE, // Specify that this is an update request
      );
      // Check if the response is not null and contains a document ID
      if (response != null && response.docid.isNotEmpty) {
        print('Data successfully updated with ID: ${response.docid}');
      } else {
        print('Failed to retrieve the updated document ID.');
      }
    } catch (e) {
      print('Failed to update vehicle data: $e');
    } finally {
      update(); // Update the state
    }
  }
}
