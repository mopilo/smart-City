import 'package:flutter/material.dart';

class ActiveParkPage extends StatelessWidget {
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: Container(
            height: 110.0,
            child: Column(
              children: <Widget>[
                Text(
                  'Token Balance',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '700045',
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5, left: 20, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              // alignment: Alignment.center,
              child: Expanded(
                  flex: 2,
                  child: Container(
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                    ),
                    child: Icon(
                      Icons.directions_car,
                      color: Colors.black,
                    ),
                  )),
            ),
            Expanded(
              flex: 4,
              child: Container(
                height: 70,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: (Text('2 Hours 59Minutes 22 Seconds',
                            style: TextStyle(fontSize: 10))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(2),
                      child: (Text(
                        'Maitama',
                        style: TextStyle(fontSize: 10),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
