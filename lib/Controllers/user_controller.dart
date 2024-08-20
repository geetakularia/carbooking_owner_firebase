import 'dart:convert';

import 'package:car_booking_owner/Data/Network/networkapi_service.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Res/Apis/apis.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/Utils/Enums/enums.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/Views/Authentication/Login_screen.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _services = NetworkapiService();

  DataResponse<Usermodel> _userdata = DataResponse.loading();
  DataResponse<Usermodel> get userdata => _userdata;
/******************************* sign up */
  Future<void> signup(Map<String, dynamic> data) async {
    final Usermodel userdata = Usermodel.fromjson(data["userdata"]);
    try {
      final credential = await _services.authenticate(AuthState.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      final String userid = credential.user!.uid;
      // print("-=-=-=-=--=///////${userid}\\\\\\-=-=-=-");
      // print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      if (userid.isNotEmpty) {
        await _services.post(Apis().userdoc(userid),
            await userdata.copywith(id: userid).tomap());

        _userdata = DataResponse.completed(userdata.copywith(id: userid));
        prefrance.setUserPrefs(userdata);
        Get.offAllNamed(RoutesName.BottomScreen);
      }
    } catch (e) {
      DataResponse.error(e.toString());
    } finally {
      update();
    }
  }

/************************** login */
  Future<void> login(String email, String password) async {
    try {
      final snapshot = await _services.getdata(
              Apis().getusercollection.where("email", isEqualTo: email))
          as QuerySnapshot<Map<String, dynamic>>;
      if (snapshot.docs.isNotEmpty) {
        await _services.authenticate(AuthState.LOGIN,
            json: {"email": email, "password": password}) as UserCredential;
        final Usermodel usermodeldata =
            Usermodel.fromjson(snapshot.docs.first.data());
        _userdata = DataResponse.completed(usermodeldata);
        prefrance.setUserPrefs(usermodeldata);
        // print(prefrance.getstring(email));
        // // usermodeldata.copywith(email: email);
        // print(
        //     "-=-=-=-=-=-==-=-${usermodeldata.copywith(email: email)}-----------------");
        Get.offAllNamed(RoutesName.BottomScreen);
      }
    } catch (e) {
      _userdata = DataResponse.error(e.toString());
      print("-------login error:: $e-------");
    }
  }

/************************** logout */
  Future<void> logout() async {
    try {
      await _services.authenticate(AuthState.LOGOUT);
      prefrance.removePrefs(prefrance.userkey);
      Get.offAllNamed(RoutesName.login_screen);
    } catch (e) {
      print("=====================");
      print(e.toString());
      print("=====================");
    }
  }

/************************** relogin */
  Future<void> relogin() async {
    try {
      final String userId = prefrance.getstring(prefrance.userkey);
      print(userId);
      if (userId.isNotEmpty) {
        final data = await Apis().userdoc(jsonDecode(userId)["id"]).get();

        if (data.exists) {
          final Usermodel usermodeldata = Usermodel.fromjson(data.data()!);
          _userdata = DataResponse.completed(usermodeldata);
          prefrance.setUserPrefs(usermodeldata);

          Get.offAllNamed(RoutesName.BottomScreen);
        } else {
          _userdata = DataResponse.error("User data not found.");
          Get.to(Login_screen());
        }
      } else {
        Get.offAllNamed(RoutesName.login_screen);
      }
    } catch (e) {
      _userdata = DataResponse.error(e.toString());
      print("-------relogin error:: $e-------");
      Get.offAllNamed(RoutesName.login_screen);
    } finally {
      update();
    }
  }
}
