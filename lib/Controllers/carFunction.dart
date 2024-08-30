import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler {
  // final _firestore = FirebaseFirestore.instance;

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
    } catch (e) {}
  }

  /// collection
  Future<List<FirebaseResponseModel>> _getDataFromCollection(
      CollectionReference reff) async {
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
  // var _allCars = <Car_model>[].obs; // Make the list observable

  List<Car_model> get getallcars => _allCars;
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
      print("==================================${e}");
    } finally {
      update();
    }
  }

  addNewProduct(Car_model model) async {
    try {
      final response = await _function.postData(
          _databse.collection("MyCars"), model.toProduct());
      if (response != null) {
        _allCars.add(Car_model.fromcars(response));
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }
}
