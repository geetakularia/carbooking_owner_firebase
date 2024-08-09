import 'package:car_booking_owner/Data/Network/networkapi_service.dart';
import 'package:car_booking_owner/Models/UserModel.dart';
import 'package:car_booking_owner/Res/Apis/apis.dart';
import 'package:car_booking_owner/Response/DataResponse.dart';
import 'package:car_booking_owner/Utils/Enums/enums.dart';
import 'package:car_booking_owner/Views/BottomNavigationBar/Bottomnavbar_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _services = NetworkapiService();
  dynamic _user;
  dynamic get getuserdata => _user;
  // LOADING
  bool _loading = false;

  // LOADING GET
  bool get loading => _loading;

  // LOADING SET
  setloading(bool value) {
    _loading = value;
    update();
  }

  DataResonse<Usermodel> _userdata = DataResonse.loading();
  DataResonse<Usermodel> get userdata => _userdata;

  Future<void> signup(Map<String, dynamic> data) async {
    final Usermodel userdata = Usermodel.fromjson(data["userdata"]);
    try {
      final credential = await _services.authenticate(AuthState.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      //TODO: get uid from Authantication
      final String userid = credential.user!.uid;
      // print("-=-=-=-=--=///////${userid}\\\\\\-=-=-=-");
      // print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      if (userid.isNotEmpty) {
        await _services.post(Apis().userdoc(userid),
            await userdata.copywith(id: userid).tomap());
        _user = userdata.copywith(id: userid);
        Get.to(BottomScreen());
      }
    } catch (e) {
      print("---------$e----------");
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
        _user = usermodeldata;
        Get.to(BottomScreen());
      }
    } catch (e) {
      print("-------login error:: $e-------");
    }
  }
}
