import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_city/shared/env.dart';
import 'package:http/http.dart' as http;

class ParkOwner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ParkState();
}

class _ParkState extends State<ParkOwner> {
  String url = Env().apiUrl;

  final TextEditingController _parkName = new TextEditingController();
  final TextEditingController _zoneCode = new TextEditingController();
  final TextEditingController _parkRate = new TextEditingController();
  final TextEditingController _parkToken = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Park Owner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: _parkName,
            decoration: InputDecoration(
                hintText: 'park name', hintStyle: TextStyle(fontSize: 13)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: _zoneCode,
                decoration: InputDecoration(
                    hintText: 'park zone', hintStyle: TextStyle(fontSize: 13)),
                keyboardType: TextInputType.text,
              )),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: _parkRate,
                decoration: InputDecoration(
                    hintText: 'park rate', hintStyle: TextStyle(fontSize: 13)),
                keyboardType: TextInputType.text,
              )),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: _parkToken,
                decoration: InputDecoration(
                    hintText: 'park token', hintStyle: TextStyle(fontSize: 13)),
                keyboardType: TextInputType.text,
              )),
          RaisedButton(
            onPressed: addPark,
            child: Text(
              'ADD CAR',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.indigo,
          ),
        ]),
      ),
    );
  }

  Future<String> addPark() async {
    var park_name = _parkName.text.trim();
    var zone_code = _zoneCode.text.trim();
    var park_rate = _parkRate.text.trim();
    var park_token = _parkToken.text.trim();

    if (park_name == '' ||
        park_rate == '' ||
        zone_code == '' ||
        park_token == '') {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text("Fill up all fields"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      );
      showDialog(context: context, child: alertDialog);
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        child: new Dialog(
          child: Container(
            height: 100,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: new CircularProgressIndicator(),
                ),
                new Text("Adding Park"),
              ],
            ),
          ),
        ),
      );

      Map body = {
        'UserID': 'get from pref',
        'ParkName': park_name,
        'ZoneCode': zone_code,
        'ParKRate': park_rate,
        'ParkToken': park_token
      };
      await Env().getHeader().then((Map header) {
        var response = http
            .post(Uri.encodeFull("$url/User/CreateParkZone"), headers: header, body: body)
            .then((response) {
          Map responseJson = json.decode(response.body);
          if(response.statusCode == 200){
            print('object');
          }
        });
      });
    }
    return 'success';
  }
}
