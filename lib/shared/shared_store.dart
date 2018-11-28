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

  Future getData() async{
    var user;
   final prefs = await SharedPreferences.getInstance().then((response){
       user =  response.getString('data');
   });
   
   var data =  json.decode(user);
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