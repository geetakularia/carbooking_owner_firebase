import 'package:car_booking_owner/Functions/Addimg.dart';
import 'package:car_booking_owner/Models/carmodel.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
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

