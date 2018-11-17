import 'package:flutter/material.dart';

import 'package:smart_city/screens/tabs/vehicleTabs/park_history.dart';
import 'package:smart_city/screens/tabs/vehicleTabs/topUp_history.dart';


class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.local_car_wash, color: Colors.white),
          onPressed: () {},
        ),
        title: (Text(
          'Smart City',
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // ...
            },
          ),
        ],
      ),
      body: new DefaultTabController(
        length: 2,
        child: Column(children: <Widget>[
          Container(
            constraints: BoxConstraints(maxHeight: 150),
            child: Material(
                color: Colors.transparent,
                child: TabBar(
                  tabs: [
                    Tab(text: 'Parking History'),
                    Tab(text: 'TopUp History'),
                  ],
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 14.0),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  unselectedLabelStyle: TextStyle(fontSize: 14.0),
                )),
          ),
          Expanded(
            child: TabBarView(
              children: [
                ParkHistory(),
                TopUpHistory()
              ]
            ),
          ),
        ]),
      ),
    );
  }
}
