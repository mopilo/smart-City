import 'package:flutter/material.dart';
import 'package:smart_city/components/header.dart';
import 'package:smart_city/database/DBHelper.dart';
import 'package:smart_city/models/car.dart';

Future<List<Car>> getCarFromDB() async {
  var dbHelper = DBHelper();
  Future<List<Car>> cars = dbHelper.getCar();
  return cars;
}

class ParkPage extends StatefulWidget {
  @override
  _ParkPageState createState() => new _ParkPageState();

}
class _ParkPageState extends State<ParkPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
               decoration: BoxDecoration(
                boxShadow: [new BoxShadow(
          color: Colors.grey,
          blurRadius: 0.5,
        ),
                ]),
              margin: EdgeInsets.only(top: 5, left: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    child: Expanded(
                        flex: 2,
                        child: Container(
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                          ),
                          child: Icon(
                            Icons.add_location,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: Color(0XFFFCFCFC)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 10, bottom: 4),
                            child: (Text(
                              'Choose Zone',
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: (Text('Touch here to set your zone',
                                  style: TextStyle(fontSize: 10))),
                            ),
                          ),
                        ],
                      ),
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
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),
            // second

            Container(
              decoration: BoxDecoration(
                boxShadow: [new BoxShadow(
          color: Colors.grey,
          blurRadius: 0.5,
        ),
                ]),
              margin: EdgeInsets.only(top: 5, left: 20, right: 30),
              child: Row(
                children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    child: Expanded(
                        flex: 2,
                        child: Container(
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                          ),
                          child: Icon(
                            Icons.directions_car,
                            color: Colors.white,
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
                            margin: EdgeInsets.only(left: 10, bottom: 4),
                            alignment: Alignment.centerLeft,
                            child: (Text(
                              'Choose Vehicle',
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: (Text('Touch here to set your vehicle',
                                  style: TextStyle(fontSize: 10))),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Color(0XFFFCFCFC)),
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
                          icon: Icon(Icons.arrow_forward_ios),
                          color: Colors.black,
                          onPressed: () {
                            // AlertDialog alertDialog = new AlertDialog(
                            //   title: new Text("Choose Vehicle"),
                            //   content: FutureBuilder<List<Car>>(
                            //       future: getCarFromDB(),
                            //       builder: (context, snapshot) {
                            //         if (snapshot != null) {
                            //           if (snapshot.data.length == 0) {
                            //             Container();

                            //             return ListView.builder(
                            //                 itemCount: snapshot.data.length,
                            //                 itemBuilder: (context, index) {
                            //                   return Container(
                            //                     alignment: Alignment.center,
                            //                     child: Row(
                            //                       children: <Widget>[
                            //                         Radio(),
                            //                         Text(
                            //                           snapshot.data[index]
                            //                               .car_model,
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   );
                            //                 });
                            //           }
                            //           return new Container(
                            //               alignment: Alignment.center,
                            //               child: CircularProgressIndicator());
                            //         }
                            //       }),
                            //   actions: <Widget>[
                            //     new FlatButton(
                            //       // onPressed: () => Navigator.pop(context),
                            //       child: Text('OK'),
                            //     )
                            //   ],
                            // );
                            // showDialog(context: context, child: alertDialog);
                          },
                        ),
                      )),
                ],
              ),
            ),

            //third one
            Container(
               decoration: BoxDecoration(
                boxShadow: [new BoxShadow(
          color: Colors.grey,
          blurRadius: 0.5,
        ),
                ]),
              margin: EdgeInsets.only(top: 5, left: 20, right: 30),
              child: Row(
                children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    child: Expanded(
                        flex: 2,
                        child: Container(
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                          ),
                          child: Icon(
                            Icons.departure_board,
                            color: Colors.white,
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
                            margin: EdgeInsets.only(left: 10, bottom: 4),
                            alignment: Alignment.centerLeft,
                            child: (Text(
                              'Choose Duration',
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: (Text('Touch here to set time duration ',
                                  style: TextStyle(fontSize: 10))),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Color(0XFFFCFCFC)),
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
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),

            //button
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              child: RaisedButton(onPressed: () {}, child: Text('PARK NOW')),
            ),
          ],
        ),
      ),
    );
  }
}
