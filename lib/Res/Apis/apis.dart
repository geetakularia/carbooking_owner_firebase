import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  final _Database = FirebaseFirestore.instance;
  //collection of user
  CollectionReference<Map<String, dynamic>> get getusercollection =>
      _Database.collection("Owner");
  //collection of car
  CollectionReference<Map<String, dynamic>> get getcarcollection =>
      _Database.collection("Cars");
  //collection of Allcar
  CollectionReference<Map<String, dynamic>> get getoffercollection =>
      _Database.collection("Offers");
  //collection of Allcar
  CollectionReference<Map<String, dynamic>> get getallcarcollection =>
      _Database.collection("AllCarsFromAdmin");
  //doc for user
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      getusercollection.doc(id);
  //DOC for CAR
  DocumentReference<Map<String, dynamic>> cardoc(String? id) =>
      getcarcollection.doc(id);
  //DOC for CAR
  DocumentReference<Map<String, dynamic>> offerdoc(String? id) =>
      getoffercollection.doc(id);
}
