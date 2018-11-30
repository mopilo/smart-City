import 'package:flutter/material.dart';
import 'package:smart_city/components/header.dart';
class ParkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
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
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),

            //third one
            Container(
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
              child: RaisedButton(child: Text('PARK NOW')),
            ),
          ],
        ),
      ),
    );
  }
}
