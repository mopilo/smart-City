import 'package:flutter/material.dart';

import 'package:smart_city/screens/tabs/topup.dart';
import 'package:smart_city/screens/tabs/vehicle.dart';
import 'package:smart_city/screens/tabs/park.dart';
import 'package:smart_city/screens/tabs/history.dart';
import 'package:smart_city/screens/tabs/active_park.dart';

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.local_parking, ), text: 'Park A Car'),
              Tab(icon: Icon(Icons.local_car_wash,), text: 'Active Parking'),
              Tab(icon: Icon(Icons.history,), text: 'History'),
              Tab(icon: Icon(Icons.directions_car,), text: 'My Vehicles'),
              Tab(icon: Icon(Icons.credit_card,), text: 'TopUp')
            ],
            labelColor:Colors.indigo,
            labelStyle: TextStyle(fontSize: 10.0),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.indigo,
            unselectedLabelStyle: TextStyle(fontSize: 10.0),
          ),
          body: TabBarView(
            children: <Widget>[
              ParkPage(),
              ActiveParkPage(),
              HistoryPage(),
              VehiclesPage(),
              TopUpPage(),
            ],
          ),
        ),
      ),
    );
  }

}