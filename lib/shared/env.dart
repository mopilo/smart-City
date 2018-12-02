
import 'dart:async';
import 'package:smart_city/shared/shared_store.dart';


class Env {
  Env();

  String apiUrl= "https://smartcitynigeria.azurewebsites.net";

  Future<Map> getAuthHeader() async {
    var token =  await SharedStore().getToken() ;
    Map<String, String> header = {
         "Accept": "application/json",
         "Authorization": "Bearer $token"
    };
    return header; 
  }

   Future<Map> getHeader() async {
    Map<String, String> header = {
         "Accept": "application/json",
    };
    return header; 
  }



}