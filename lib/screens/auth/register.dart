import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget{

  final TextEditingController _username = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _cpassword = new TextEditingController();
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _email = new TextEditingController();

//login info
  Widget _user() => new Container(
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
          controller: _username,
          decoration: new InputDecoration.collapsed(hintText: "username"),
          keyboardType: TextInputType.text,
        ),
      );

  Widget _pass() => new Container(
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
          controller: _password,
          decoration: new InputDecoration.collapsed(hintText: "Password"),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
      );
      


  Widget _cpass() => new Container(
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
          controller: _cpassword,
          decoration: new InputDecoration.collapsed(hintText: "re-enter password"),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
      );


  //personal info
  Widget _yourUserName() => new Container(
    alignment: new Alignment(0.5, 0.5),
    height: 46.0,
    margin: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 10.0),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration:
            new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                border: new Border.all(color: Colors.white),
                color: Colors.white
              ),
        child: new TextField(
          controller: _name,
          decoration: new InputDecoration.collapsed(hintText: "username"),
          keyboardType: TextInputType.text,
        ),
      );

  Widget _unknown() => new Container(
    alignment: new Alignment(0.5, 0.5),
    height: 46.0,
    margin: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 20.0),
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration:
            new BoxDecoration(
                borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
                border: new Border.all(color: Colors.white),
                color: Colors.grey
              ),
        child: new TextField(
          controller: _username,
          decoration: new InputDecoration.collapsed(hintText: "01"),
          keyboardType: TextInputType.text,
        ),
      );

Widget _yourEmail() => new Container(
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
          decoration: new InputDecoration.collapsed(hintText: "Your email"),
          keyboardType: TextInputType.text,
        ),
      );

      //button
      Widget loginButton(BuildContext context) => new Padding(
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
            Navigator.of(context).pushReplacementNamed("/login");
          },
          color: Colors.white,
          child: Text(' REGISTER', style: TextStyle(color: Colors.black)),
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
              child: Center(
          child: new Container(
            margin: EdgeInsets.only(top: 80),
            alignment: Alignment.center,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text('Enter your details and click register to complete registration process ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0, color: Colors.white ),
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Text('Login information', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                  ],
                ),
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                      _user(),
                      _pass(),
                      _cpass(),
                //     ]
                //   ),
                // )

                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Text('Personal information', style: TextStyle(color: Colors.white, fontSize: 12.0),)
                  ],
                ),
                _yourUserName(),
                // _unknown(),
                _yourEmail(),
                loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

}