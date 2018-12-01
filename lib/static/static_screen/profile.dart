import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
         Navigator.of(context).pop();
},
          icon: Icon(Icons.arrow_back,
          color: Colors.white,
          )),
        title: Text('Profile', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
          // alignment: Alignment.topCenter,
          margin: EdgeInsets.all(40),
          child: Column(children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Icon(Icons.local_parking, size: 50, color: Colors.grey,)),
                Text('Username: admin'),
                Text('Email: hello@smartcity.com'),
                Text('Full Name: admin'),
                Text('Phone Number: 09089695949'),
              ],
            )),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                padding: EdgeInsets.only(left: 100, right: 100),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){},
                child: Text('LOGOUT')
              ),
            )
          ])),
    );
  }
}
