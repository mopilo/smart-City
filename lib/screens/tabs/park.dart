import 'package:flutter/material.dart';

class ParkPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.local_car_wash, color: Colors.white),
          onPressed: (){},
        ),
        title: (Text('Smart City')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white,),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // ...
            },
          ),
        ],
      ),
      body: Center(
        child: Text('park car')
      ),
    );
  }
}