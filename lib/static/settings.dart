import 'package:flutter/material.dart';


class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text('Settings'),  
      ),
      body: Center(
        child: Text('data')
      ),
    );
  }

}