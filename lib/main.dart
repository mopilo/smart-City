import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smart_city/screens/auth/start.dart';
import 'package:smart_city/screens/auth/confirm.dart';


void main() {
  //set device orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Smart City',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: new WelcomePage(),
      routes: <String, WidgetBuilder>{
        "/start": (BuildContext context) => new WelcomePage(),
        "/confirm": (BuildContext context) => new ConfirmationPage()
      }
    );
  }
}
