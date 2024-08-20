import 'dart:convert';
import 'package:car_booking_owner/Data/Network/baseapi_service.dart';
import 'package:car_booking_owner/Data/app_exceptions.dart';
import 'package:car_booking_owner/Utils/Enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class NetworkapiService extends BaseapiService {
  final _auth = FirebaseAuth.instance;
  @override
  Future authenticate(AuthState state, {Map<String, dynamic>? json}) async {
    String email = "";
    String password = "";
    if (json != null) {
      email = json["email"] ?? "";
      password = json["password"] ?? "";
    }
    if (state == AuthState.SIGNUP) {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } else if (state == AuthState.LOGIN) {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } else if (state == AuthState.LOGOUT) {
      await _auth.signOut();
    }
  }

  //TODO/////////////////////***post data */

  @override
  Future post(path, Map<String, dynamic> data) async {
    if (path is CollectionReference) {
      return await path.add(data);
    } else {
      return await (path as DocumentReference).set(data);
    }
  }

  /********* get data */
  @override
  Future getdata(path) async {
    dynamic response;
    try {
      if (path is CollectionReference) {
        response = await path.get();
      } else if (path is DocumentReference) {
        response = await path.get();
      } else if (path is Query<Map<String, dynamic>>) {
        response = await path.get();
      }
    } catch (e) {
      rethrow;
    }
    return response;
  }

  // UPDATE DATA
  @override
  Future upDate(path, Map<String, dynamic> data) async {
    try {
      if (path is DocumentReference) {
        await path.update(data);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Return Response
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error communicating with server \n with status code : ${response.body.toString()}");
    }
  }
}
