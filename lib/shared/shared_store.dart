import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';







class SharedStore {

  //SharedStore ();
  /// Get a book by its id, if there is not entry for that ID, returns null.
  Future<dynamic> getFromStore(String key) async{
    final prefs = await SharedPreferences.getInstance();
    return  prefs.getString(key) ?? "";
  }

   /// Get a book by its id, if there is not entry for that ID, returns null.
  Future<String> getToken() async{
   final prefs = await SharedPreferences.getInstance();
   return  prefs.getString('token');
  }
  
  // Future getUser() async{
  //   var user;
  //  final prefs = await SharedPreferences.getInstance().then((response){
  //      user =  response.getString('user');
  //  });
   
  //  var data =  json.decode(user);
  //  return data;
  // }

  Future getUserId() async{
    var user;
   final prefs = await SharedPreferences.getInstance().then((response){
       user =  response.getString('userid');
   });
   
   var data =  json.decode(user);
   return data;
  }

  Future getSId() async{
    var sec;
   final prefs = await SharedPreferences.getInstance().then((response){
       sec =  response.getString('sid');
   });
   
   var data =  json.decode(sec);
   return data;
  }

  Future getRole() async{
    var role;
   final prefs = await SharedPreferences.getInstance().then((response){
       role =  response.getString('role');
   });
   
   var data =  json.decode(role);
   return data;
  }

  Future getEmail() async{
    var email;
   final prefs = await SharedPreferences.getInstance().then((response){
       email =  response.getString('email');
   });
   
   var data =  json.decode(email);
   return data;
  }


  //TODO escape not allowed characters eg. ' " '
  /// Inserts or replaces the book.
 updateStore(data) async {
    // obtain shared preferences 
    final prefs = await SharedPreferences.getInstance();
    // set new value
    Future<bool> setr = prefs.setString(data["key"], data["value"]);
    return  setr;
  }

  


Future deleteStore(key) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

deleteAll() async{
  // Delete a record
  // var db = await _getDb();
  // db.rawDelete('DELETE  FROM store WHERE key =?',['token']);
  // var count = Sqflite
  //   .firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM store"));
  //   return count;
}


}