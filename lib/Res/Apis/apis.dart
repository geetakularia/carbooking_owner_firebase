import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  final _Database = FirebaseFirestore.instance;
  //collection of user
  CollectionReference<Map<String, dynamic>> get getusercollection =>
      _Database.collection("Owner");
  //collection of car
  CollectionReference<Map<String, dynamic>> get getcarcollection =>
      _Database.collection("Cars");
  //doc for user
  DocumentReference<Map<String, dynamic>> userdoc(String? id) =>
      getusercollection.doc(id);
}
