import 'package:flutter/material.dart';
import 'package:smart_city/components/header.dart';

class TopUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyAppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
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
                            color: Colors.indigo,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('100', style: TextStyle(color: Colors.white, fontSize: 16),),
                              Text('tokens', style: TextStyle(color: Colors.white, fontSize: 12),),
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(color: Color(0XFFFCFCFC)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 10, bottom: 4),
                            child: (Text(
                              'N1000',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: (Text('Get 100 tokens for N1000 ',
                                  style: TextStyle(fontSize: 10)))
                            ),
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
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),
            // second

            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 30),
              child: Row(
                children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    child: Expanded(
                        flex: 2,
                        child: Container(
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('500', style: TextStyle(color: Colors.white, fontSize: 16),),
                              Text('tokens', style: TextStyle(color: Colors.white, fontSize: 12),),
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 4),
                            alignment: Alignment.centerLeft,
                            child: (Text(
                              'N3000',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: (Text('Get 500 tokens for N3000 ',
                                  style: TextStyle(fontSize: 10))),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Color(0XFFFCFCFC)),
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
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),

            //third one
            Container(
              margin: EdgeInsets.only(top: 5, left: 20, right: 30),
              child: Row(
                children: <Widget>[
                  Container(
                    // alignment: Alignment.center,
                    child: Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('1,000', style: TextStyle(color: Colors.white, fontSize: 16),),
                              Text('tokens', style: TextStyle(color: Colors.white, fontSize: 12),),
                            ],
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 70,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 4),
                            alignment: Alignment.centerLeft,
                            child: (Text(
                              'N5000',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: (Text('Get 1000 tokens for N5000 ',
                                  style: TextStyle(fontSize: 10))),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(color: Color(0XFFFCFCFC)),
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
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            ),

            //button
            // Container(
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.all(20),
            //   child: RaisedButton(child: Text('PARK NOW')),
            // ),
          ],
        ),
      ),
    );
  }
}
