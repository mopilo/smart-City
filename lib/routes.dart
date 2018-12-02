import 'package:flutter/material.dart';
import 'package:smart_city/screens/auth/start.dart';
import 'package:smart_city/screens/auth/confirm.dart';
import 'package:smart_city/screens/auth/register.dart';
import 'package:smart_city/screens/auth/login.dart';
import 'package:smart_city/screens/mainTab.dart';
import 'package:smart_city/screens/owner/park_owner.dart';
import 'package:smart_city/static/settings.dart';
import 'package:smart_city/static/static_screen/about.dart';
import 'package:smart_city/static/static_screen/profile.dart';

final routes = {
  "/start": (BuildContext context) => new WelcomePage(),
  "/confirm": (BuildContext context) => new ConfirmationPage(),
  "/register": (BuildContext context) => new RegisterPage(),
  "/login": (BuildContext context) => new LoginPage(),
  "/tabs": (BuildContext context) => new MainPage(),
  "/settings": (BuildContext context) => new Settings(),
  "/profile": (BuildContext context) => new Profile(),
  "/about": (BuildContext context) => new About(),
  "/park_owner": (BuildContext context) => new ParkOwner(),

};
