import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: Text(
            'About Parkcrowdy',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('ParkCrowdy', style: TextStyle(color: Colors.white, fontSize: 30),),
            Text('Version 1.0.0', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('Developed by mopilo', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('Email us', style: TextStyle(color: Colors.white, fontSize: 16))
          ]),
        ));
  }
}
