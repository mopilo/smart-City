import 'package:flutter/material.dart';

class MyAppBar extends AppBar {

  MyAppBar({Key key, Widget title, BuildContext context})
      : super(
          key: key,
          leading: Icon(
            Icons.local_car_wash,
            color: Colors.white
          ),
          title: Text('Smart City'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              tooltip: 'Open shopping cart',
              onPressed: () {
                    Navigator.of(context).pushNamed("/about");
                    print('object');
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
        );

  //  AppBar(
  //   centerTitle: true,
  //   elevation: 0.0,
  //   backgroundColor: Colors.indigo,
  //   leading: IconButton(
  //     icon: Icon(Icons.local_car_wash, color: Colors.white),
  //     onPressed: () {},
  //   ),
  //   title: (Text(
  //     'Smart City',
  //   )),
  //   actions: <Widget>[
  //     IconButton(
  //       icon: Icon(
  //         Icons.settings,
  //         color: Colors.white,
  //       ),
  //       tooltip: 'Open shopping cart',
  //       onPressed: () {
  //         // ...
  //       },
  //     ),
  //   ],
  //   bottom: PreferredSize(
  //     preferredSize: const Size.fromHeight(150.0),
  //     child: Container(
  //       height: 110.0,
  //       child: Column(
  //         children: <Widget>[
  //           Text(
  //             'Token Balance',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //           Text(
  //             '700045',
  //             style: TextStyle(color: Colors.white, fontSize: 40.0),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: <Widget>[
  //               Padding(
  //                 padding: EdgeInsets.all(10.0),
  //                 child: Icon(
  //                   Icons.refresh,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),
  // )

}
