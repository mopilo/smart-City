import 'package:flutter/material.dart';
import 'package:smart_city/screens/auth/start.dart';
import 'package:smart_city/screens/auth/confirm.dart';
import 'package:smart_city/screens/auth/register.dart';
import 'package:smart_city/screens/auth/login.dart';
import 'package:smart_city/screens/mainTab.dart';



final routes = {
   "/start": (BuildContext context) => new WelcomePage(),
        "/confirm": (BuildContext context) => new ConfirmationPage(),
        "/register": (BuildContext context) => new RegisterPage(),
        "/login": (BuildContext context) => new LoginPage(),
        "/tabs": (BuildContext context) => new MainPage(),
};