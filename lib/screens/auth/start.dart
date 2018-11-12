import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget{
  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{

  final TextEditingController _number = new TextEditingController();
  final TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget email() => new Container(
    alignment: new Alignment(0.5, 0.5),
    height: 46.0,
    margin: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 20.0),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration:
            new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                border: new Border.all(color: Colors.white),
                color: Colors.white
              ),
        child: new TextField(
          controller: _email,
          decoration: new InputDecoration.collapsed(hintText: "Email"),
          keyboardType: TextInputType.emailAddress,
        ),
      );

Widget number() => new Container(
    alignment: new Alignment(0.5, 0.5),
    height: 46.0,
    margin: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 20.0),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration:
            new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                border: new Border.all(color: Colors.white),
                color: Colors.white
              ),
        child: new TextField(
          controller: _number,
          decoration: new InputDecoration.collapsed(hintText: "Phone number"),
          keyboardType: TextInputType.phone,
        ),
      );
    
    final loginButton = Padding(
      // padding: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        shadowColor: Colors.white,
        elevation: 2.0,
        child: MaterialButton(
          minWidth: 400.0,
          height: 46.0,
          onPressed: () {
          Navigator.of(context).pushReplacementNamed("/confirm");
          },
          color: Colors.white,
          child: Text(' SEND', style: TextStyle(color: Colors.black)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Already have an account?',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );

    return Scaffold(
      body: Center(
        child:  Container(
          alignment: Alignment.center,
          color: Colors.indigo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //image here
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Enter your phone number and email to recieve comfirmation code from smartcity',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                    ),
                    number(),
                    email(),
                    loginButton,
                  ]
                ),
              ),
              Expanded(
                flex: 1,
                child: forgotLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}