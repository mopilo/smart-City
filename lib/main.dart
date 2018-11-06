import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smart_city/screens/auth/start.dart';


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
    );
  }
}
