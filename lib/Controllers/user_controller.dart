import 'dart:convert';

import 'package:car_booking_owner/Data/Network/networkapi_service.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Preferences/sharedpreferences.dart';
import 'package:car_booking_owner/Res/Apis/apis.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/Utils/Enums/enums.dart';
import 'package:car_booking_owner/Utils/Routes/routes_name.dart';
import 'package:car_booking_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _services = NetworkapiService();

  DataResonse<Usermodel> _userdata = DataResonse.loading();
  DataResonse<Usermodel> get userdata => _userdata;

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

        _userdata = DataResonse.completed(userdata.copywith(id: userid));
        prefrance.setUserPrefs(userdata);
        Get.offAllNamed(RoutesName.BottomScreen);
      }
    } catch (e) {
      DataResonse.error(e.toString());
    } finally {
      update();
    }
  }

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
        _userdata = DataResonse.completed(usermodeldata);
        prefrance.setUserPrefs(usermodeldata);

        Get.offAllNamed(RoutesName.BottomScreen);
      }
    } catch (e) {
      _userdata = DataResonse.error(e.toString());
      print("-------login error:: $e-------");
    }
  }

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

  // Future relogin() async {
  //   try {
  //     final shareduid = prefrance.getstring().toString();
  //     if (shareduid.isNotEmpty) {
  //       final data = await Apis().userdoc(shareduid).get();
  //       if (data.exists) {
  //         _userdata = Usermodel.fromjson(json)
  //       }
  //     }
  //   } catch (e) {}
  // }

  Future<void> relogin() async {
    try {
      final String userId = prefrance.getstring(prefrance.userkey);

      if (userId.isNotEmpty) {
        final data = await Apis().userdoc(jsonDecode(userId)["id"]).get();
        print("=======================");
        print(jsonDecode(userId)["id"]);

        if (data.exists) {
          final Usermodel usermodeldata = Usermodel.fromjson(data.data()!);

          _userdata = DataResonse.completed(usermodeldata);

          prefrance.setUserPrefs(usermodeldata);

          Get.offAllNamed(RoutesName.BottomScreen);
        } else {
          _userdata = DataResonse.error("User data not found.");
          Get.offAllNamed(RoutesName.login_screen);
        }
      } else {
        Get.offAllNamed(RoutesName.login_screen);
      }
    } catch (e) {
      _userdata = DataResonse.error(e.toString());
      print("-------relogin error:: $e-------");
      Get.offAllNamed(RoutesName.login_screen);
    } finally {
      update();
    }
  }
}
