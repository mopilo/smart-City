import 'dart:async';
import 'package:path/path.dart';
import 'package:smart_city/models/car.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class DBHelper {
  final String TABLE_NAME = 'Cars';
  static Database db_instance;

  Future<Database> get db async {
    if (db_instance == null) {
      db_instance = await initDB();
    }
    return db_instance;
  }

  initDB() async {
    io.Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'SmartCity.db');
    var db = await openDatabase(path, version: 1, onCreate: onCreateFunc);
    return db;
  }

  void onCreateFunc(Database db, int version) async{
    //create table
    await db.execute('CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT, plate TEXT, model TEXT);');
      print("Created tables");
  }


  //CRUD

  Future<List<Car>> getCar () async{
    var db_connection = await db;
    List<Map> list = await db_connection.rawQuery('SELECT * FROM $TABLE_NAME');
    List<Car> cars = new List();
    for(int i = 0; i < list.length; i++){
      Car car = new Car();
      car.id = list[i]['id'];
      car.plate_no = list[i]['plate'];
      car.car_model = list[i]['model'];

      cars.add(car);
    }
    return cars;
  }

  //add cars

  void addCars (Car car) async {
    var db_connection = await db;
    String query = 'INSERT INTO $TABLE_NAME(plate,model) VALUES (\'${car.plate_no}\',\'${car.car_model}\')';
    await db_connection.transaction((transaction) async{
        return transaction.rawInsert(query);
      });
  }

  void deleteCar (Car car) async {
    var db_connection = await db;
    String query = 'DELETE FROM $TABLE_NAME WHERE id = ${car.id}';
    await db_connection.transaction((transaction) async{
        return transaction.rawQuery(query);
      });
  }
}
