import 'package:flutter/material.dart';
import 'package:smart_city/static/static_screen/about.dart';
import 'package:smart_city/static/static_screen/profile.dart';

class Settings extends StatelessWidget {
  get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (__) => new Profile()));                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(Icons.person_outline),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Profile'),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  AlertDialog alertDialog = new AlertDialog(
                    title: new Text('Email is not valid'),
                    content: Row(children: [
                      Radio(
                        activeColor: Colors.green,
                      ),
                      Text('English')
                    ]),
                    actions: <Widget>[
                      new FlatButton(
                        // onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      )
                    ],
                  );
                  showDialog(context: context, child: alertDialog);
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.language),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Language'),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.insert_invitation),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Invite Friends'),
                    )
                  ],
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (__) => new About()));                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.info_outline),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('About'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
