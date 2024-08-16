import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class carjson_data {
  static String carjson = "assets/json/carjson.json";
}

class AppFunctions {}















abstract class Abstract_function {
  Future<dynamic> GetData(String json);
  Future<dynamic> PostData(String json, dynamic data);
}
 
class Error_msg implements Exception {
  final String msg;
  final String perifix;
  Error_msg(this.msg, this.perifix);
  @override
  String toString() {
    return "$msg,$perifix";
  }
}

class NetworkError extends Error_msg {
  NetworkError(String txtmg)
      : super(txtmg, "NetworkError----------------------");
}

class DatanotfoundError extends Error_msg {
  DatanotfoundError(String txtmg)
      : super(txtmg, "DatanotfoundError----------------------");
}

class SocketError extends Error_msg {
  SocketError(String txtmsg)
      : super(txtmsg, "netWork Error! please connect to the net");
}

class Network_api extends Abstract_function {
  @override
  Future GetData(String json) async {
    var response;
    try {
      final snapshot = await rootBundle.loadString(json);
      response = jsonDecode(snapshot);
      // print("gchffh$snapshot");
      // print("step-------------------------------2");
    } catch (e) {
      if (e is SocketException) {
        throw NetworkError(e.toString());
      }
    }
    // print(response);
    return response;
  }

  @override
  Future PostData(String json, data) {
    throw UnimplementedError();
  }
}

switch_case(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var db = response.body;
      return db;
    case 404:
      NetworkError(response.body.toString());
    default:
      "Technical Error!";
  }
}
