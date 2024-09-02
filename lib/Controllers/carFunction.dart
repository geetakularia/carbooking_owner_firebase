import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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
  
  List<Car_model> _allCars = [];
  List<Car_model> get getallcars => _allCars;

  Car_model? _car;
  Car_model get car => _car!;
  setCar(Car_model model) {
    _car = model;
    update();
  }

  user_delete() {
    try {
      _databse
          .collection("MyCars")
          .doc("VnFwBDL807XUowNVn34y")
          .update({"title": FieldValue.delete()});
    } catch (e) {
      print(e.toString());
    }
  }

  getCars() async {
    try {
      final response =
          await _function.getDataFromFirebase(_databse.collection("MyCars"));
      if (response is List) {
        _allCars = response.map((e) => Car_model.fromcars(e)).toList();
      }
    } catch (e) {
      print("Error getting cars: ${e}");
    } finally {
      update();
    }
  }

  Future<String?> addvehicle(Car_model model) async {
    print("");
    String? vehicleId;
    try {
      final response = await _function.postData(
        _databse.collection("addvehicle"),
        model.toAddvehicle(),
      );

      if (response != null) {
        vehicleId = response.docid;
        _allCars.add(Car_model.fromAddvehicle(response));
      }
    } catch (e) {
      print('Error adding vehicle: $e');
    } finally {
      update();
    }

    return vehicleId;
  }

  Future<void> updateVehicle(
      String uid, Map<String, dynamic> updatedData) async {
    try {
      FirebaseResponseModel? response = await _function.postData(
          _databse.collection("addvehicle").doc(uid),
          updatedData,
          RequestType.UPDATE);
      if (response != null) {
        print('Data successfully updated with ID: ${response.docid}');
      }
    } catch (e) {
      print('Error updating vehicle data: $e');
    }
  }
}
