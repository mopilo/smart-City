import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_city/shared/env.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_city/shared/shared_store.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => new _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String url = Env().apiUrl;
  final TextEditingController _number = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget number() => new Container(
          alignment: new Alignment(0.5, 0.5),
          height: 46.0,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
              border: new Border.all(color: Colors.white),
              color: Colors.white),
          child: new TextField(
            controller: _number,
            decoration: new InputDecoration.collapsed(hintText: "Token"),
            keyboardType: TextInputType.phone,
          ),
        );
    final loginButton = Padding(
      // padding: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        shadowColor: Colors.white,
        elevation: 2.0,
        child: MaterialButton(
          minWidth: 400.0,
          height: 46.0,
          onPressed: confirm,
          // Navigator.of(context).pushReplacementNamed("/register");
          color: Colors.white,
          child: Text(' CONFIRM', style: TextStyle(color: Colors.black)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Already have an account?',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
          Navigator.of(context).popAndPushNamed("/login");
      },
    );

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
            alignment: Alignment.center,
            // color: Colors.indigo,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //image here
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Text(
                              'Enter the 4-digit code you recieved from email and click confirm',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                        number(),
                        loginButton,
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: forgotLabel)
                ])),
      ),
    );
  }

  Future<String> confirm() async {
    var token = _number.text.trim();
    var data;
    if (token == '') {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text("Input can't be empty"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      );
      showDialog(context: context, child: alertDialog);
    } else if (token.length < 4) {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text('invalid token'),
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
                new Text("Confirming..."),
              ],
            ),
          ),
        ),
      );
      Map body = {'Code': token};
      await Env().getHeader().then((Map header) {
        var response = http
            .post(Uri.encodeFull("$url/User/ComFirmCode"),
                headers: header, body: body)
            .then((response) {
          Map responseJson = json.decode(response.body);
                    var data = json.decode(response.body);

          if (response.statusCode == 200) {
            Map storeSecurityID = {
              'key': 'sid',
              'value': json.encode(data['data']['SecurityID'])
            };
            Map storeUserID = {
              'key': 'userid',
              'value': json.encode(data['data']['UserDetails'][0]['UserID'])
            };

            Map storeEmail = {
              'key': 'email',
              'value': json.encode(data['data']['UserDetails'][0]['Email'])
            };

            SharedStore().updateStore(storeSecurityID);
            SharedStore().updateStore(storeUserID);
            SharedStore().updateStore(storeEmail);

            if (responseJson.containsKey('message')) {
              Fluttertoast.showToast(
                  msg: responseJson['message'],
                  toastLength: Toast.LENGTH_LONG,
                  bgcolor: '#000000',
                  gravity: ToastGravity.BOTTOM,
                  textcolor: '#FFFFFF');

              new Future<bool>.delayed(new Duration(seconds: 3), () {
                Navigator.pop(context); //pop dialog
                Navigator.of(context).pushNamed("/register");
              });
            }
          } else {
            AlertDialog dialog = new AlertDialog(
              title: new Text("Confirmation Failed, Retry Again"),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                )
              ],
            );
            Navigator.pop(context); //pop dialog
            showDialog(context: context, child: dialog);
          }
        });
      });

      // Navigator.of(context).pushReplacementNamed("/register");
    }
  }
}
