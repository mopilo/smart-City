import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_city/shared/env.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _username = new TextEditingController();
  String url = Env().apiUrl;
  @override
  Widget build(BuildContext context) {
    Widget userName() => new Container(
          alignment: new Alignment(0.5, 0.5),
          height: 46.0,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
              border: new Border.all(color: Colors.white),
              color: Colors.white),
          child: new TextField(
            controller: _username,
            decoration: new InputDecoration.collapsed(hintText: "username"),
            keyboardType: TextInputType.text,
          ),
        );

    Widget urPassword() => new Container(
          alignment: new Alignment(0.5, 0.5),
          height: 46.0,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
              border: new Border.all(color: Colors.white),
              color: Colors.white),
          child: new TextField(
            controller: _password,
            decoration: new InputDecoration.collapsed(hintText: "password"),
            keyboardType: TextInputType.text,
            obscureText: true,
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
          onPressed: signin,
          color: Colors.white,
          child: Text(' LOGIN', style: TextStyle(color: Colors.black)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Don"t have an account?',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed("/register");
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
                        userName(),
                        urPassword(),
                        loginButton,
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: forgotLabel)
                ])),
      ),
    );
  }

  Future<String> signin() async {
    var user = _username.text.trim();
    var pass = _password.text.trim();

    if (user == '' || pass == '') {
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
                new Text("Creating Account..."),
              ],
            ),
          ),
        ),
      );

      Map body = {'UserName': user, 'Password': pass};
                await Env().getHeader().then((Map header) {
var response = http
            .post(Uri.encodeFull("$url/User/Login"),
                headers: header, body: body)
            .then((response) {
               Map responseJson = json.decode(response.body);
          if (response.statusCode == 200) {}
          else {
            AlertDialog dialog = new AlertDialog(
              title: new Text("Authentication Failed, Retry Again"),
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

      // Navigator.of(context).pushReplacementNamed("/tabs");
    }
  }
}

// faleganji@yahoo.com
