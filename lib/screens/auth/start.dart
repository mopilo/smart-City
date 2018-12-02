import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_city/shared/env.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List data = [];
  String url = Env().apiUrl;
  final TextEditingController _number = new TextEditingController();
  final TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget email() => new Container(
          alignment: new Alignment(0.5, 0.5),
          height: 46.0,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
              border: new Border.all(color: Colors.white),
              color: Colors.white),
          child: new TextField(
            controller: _email,
            decoration: new InputDecoration.collapsed(hintText: "Email"),
            keyboardType: TextInputType.emailAddress,
          ),
        );

    Widget number() => new Container(
          alignment: new Alignment(0.5, 0.5),
          height: 46.0,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
              border: new Border.all(color: Colors.white),
              color: Colors.white),
          child: new TextField(
            controller: _number,
            decoration: new InputDecoration.collapsed(hintText: "Phone number"),
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
          onPressed: welcome,
          // Navigator.of(context).pushReplacementNamed("/confirm");

          color: Colors.white,
          child: Text(' SEND', style: TextStyle(color: Colors.black)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Already have an account?',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.indigo,
          child: Column(
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
                          padding:
                              EdgeInsets.only(left: 17.0, right: 17, bottom: 8),
                          child: Text(
                            'Enter your phone number and email to recieve comfirmation code from smartcity',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                      number(),
                      email(),
                      loginButton,
                    ]),
              ),
              Expanded(
                flex: 1,
                child: forgotLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> welcome() async {
    String regEmail =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var email = _email.text.trim();
    var phone = _number.text.trim();

    RegExp exp = new RegExp(regEmail);

    if (email == '' || phone == '') {
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
    } else if (!exp.hasMatch(email)) {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text('Email is not valid'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      );
      showDialog(context: context, child: alertDialog);
    } else if (phone.length < 11) {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text("Enter a valid phone number"),
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
                new Text("Loading..."),
              ],
            ),
          ),
        ),
      );
      Map body = {'PhoneNumber': phone, 'Email': email};
      await Env().getHeader().then((Map header) {
        var response = http
            .post(Uri.encodeFull("$url/User/SendCode"),
                headers: header, body: body)
            .then((response) {
          Map responseJson = json.decode(response.body);
          if (response.statusCode == 200) {
            if (responseJson.containsKey('message')) {
              Fluttertoast.showToast(
                  msg: responseJson['message'],
                  toastLength: Toast.LENGTH_LONG,
                  bgcolor: '#000000',
                  gravity: ToastGravity.BOTTOM,
                  textcolor: '#FFFFFF');
              print(responseJson['message']);
              new Future<bool>.delayed(new Duration(seconds: 3), () {
                Navigator.pop(context); //pop dialog
                    Navigator.of(context).pushReplacementNamed("/confirm");
              });
            }
          } else {
            AlertDialog dialog = new AlertDialog(
              title: new Text("Authenticated Failed"),
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

      // Navigator.of(context).pushReplacementNamed("/confirm");
    }
  }
}
