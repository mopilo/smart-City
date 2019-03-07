import 'package:flutter/material.dart';
import 'package:smart_city/components/header.dart';

class ActiveParkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context),
      body: Container(
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
                      color: Colors.black12,
                    ),
                    child: Icon(
                      Icons.directions_car,
                      color: Colors.black,
                    ),
                  )),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 70,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: (Text('2 Hours 59Minutes 22 Seconds',
                            style: TextStyle(fontSize: 10))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(2),
                      child: (Text(
                        'Maitama',
                        style: TextStyle(fontSize: 10),
                      )),
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
                    Icons.add,
                    color: Colors.green,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
