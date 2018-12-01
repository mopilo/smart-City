import 'package:flutter/material.dart';
import 'package:smart_city/database/DBHelper.dart';
import 'package:smart_city/models/car.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<List<Car>> getCarFromDB() async {
  var dbHelper = DBHelper();
  Future<List<Car>> cars = dbHelper.getCar();
  return cars;
}

class VehiclesPage extends StatefulWidget {
  @override
  _VehiclesPageState createState() => new _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  Car car = new Car();
  String plateNumber, carModel;
  final TextEditingController _carModel = new TextEditingController();
  final TextEditingController _plateNo = new TextEditingController();

  void initState() {
    super.initState();
  }
  // get addVehicle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.local_car_wash, color: Colors.white),
          onPressed: () {},
        ),
        title: (Text(
          'Smart City',
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // ...
            },
          ),
        ],
      ),
      body: new Container(
          padding: EdgeInsets.all(16),
          child: FutureBuilder<List<Car>>(
              future: getCarFromDB(),
              builder: (context, snapshot) {
                if (snapshot != null) {
                  // if(snapshot.hasData){

                  //  if(snapshot.data.length == 0){
                  //    return Text('678899');
                  //  }

                  //   return Text('data234566');
                  //   }
                  if (snapshot.hasData) {
                    if (snapshot.data.length == 0) {
                      return Container(
                          alignment: Alignment.center,
                          child: new Text("No Data found"));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 5, left: 20, right: 30),
                          child: Row(
                            children: <Widget>[
                              Container(
                                // alignment: Alignment.center,
                                child: Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.directions_car,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 70,
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 4),
                                        alignment: Alignment.centerLeft,
                                        child: (Text(
                                          snapshot.data[index].plate_no,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800),
                                        )),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: (Text(
                                              snapshot.data[index].car_model,
                                              style: TextStyle(fontSize: 14))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration:
                                      BoxDecoration(color: Color(0XFFFCFCFC)),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 70,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        var dbHelper = DBHelper();
                                        dbHelper
                                            .deleteCar(snapshot.data[index]);
                                        setState(() {
                                          getCarFromDB();
                                        });
                                        Fluttertoast.showToast(
                                            msg: 'Vehicle deleted',
                                            toastLength: Toast.LENGTH_SHORT,
                                            bgcolor: '#000000',
                                            gravity: ToastGravity.CENTER,
                                            textcolor: '#FFFFFF');
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return new Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: addCars,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  void addCars() {
    showDialog(
      context: context,
      child: new Dialog(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          height: 250,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add Vehicle',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _plateNo,
                decoration: InputDecoration(
                    hintText: 'plate number',
                    hintStyle: TextStyle(fontSize: 13)),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    controller: _carModel,
                    decoration: InputDecoration(
                        hintText: 'car model',
                        hintStyle: TextStyle(fontSize: 13)),
                    keyboardType: TextInputType.text,
                  )),
              RaisedButton(onPressed: addVehicle, child: Text('ADD CAR')),
            ],
          ),
        ),
      ),
    );
  }

  void addVehicle() {
    var _plate = _plateNo.text.trim();
    var _model = _carModel.text.trim();
    if (_plate == '' || _model == '') {
      print('fail');
    } else {
      var car = new Car();
      car.plate_no = _plate;
      car.car_model = _model;
      var db = DBHelper();
      db.addCars(car);
      Fluttertoast.showToast(
          msg: 'Vehicle Added',
          toastLength: Toast.LENGTH_SHORT,
          bgcolor: '#000000',
          gravity: ToastGravity.CENTER,
          textcolor: '#FFFFFF');
      print('created');
      _plateNo.clear();
      _carModel.clear();
    }
  }
}
