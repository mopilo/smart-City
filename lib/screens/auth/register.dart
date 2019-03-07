import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city/shared/env.dart';
import 'package:http/http.dart' as http;
import 'package:smart_city/shared/shared_store.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _cpassword = new TextEditingController();
  final TextEditingController _firstName = new TextEditingController();
  final TextEditingController _lastName = new TextEditingController();
  final List<String> _items = ['User', 'Admin'].toList();
  String url = Env().apiUrl;
  var email;
  var userId;
  String _selection;
//login info

  @override
  void initState() {
    _selection = _items.first;
    super.initState();
    _load();
  }

  Widget _user() => new Container(
        alignment: new Alignment(0.5, 0.5),
        height: 46.0,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
            border: new Border.all(color: Colors.white),
            color: Colors.white),
        child: new TextField(
          controller: _username,
          decoration: new InputDecoration.collapsed(hintText: "username"),
          keyboardType: TextInputType.text,
        ),
      );

  Widget _pass() => new Container(
        alignment: new Alignment(0.5, 0.5),
        height: 46.0,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
            border: new Border.all(color: Colors.white),
            color: Colors.white),
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
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
            border: new Border.all(color: Colors.white),
            color: Colors.white),
        child: new TextField(
          controller: _cpassword,
          decoration:
              new InputDecoration.collapsed(hintText: "re-enter password"),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
      );

  //personal info
  Widget _yourUserName() => new Container(
        alignment: new Alignment(0.5, 0.5),
        height: 46.0,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
            border: new Border.all(color: Colors.white),
            color: Colors.white),
        child: new TextField(
          controller: _firstName,
          decoration: new InputDecoration.collapsed(hintText: "First name"),
          keyboardType: TextInputType.text,
        ),
      );

  Widget _unknown() => new Container(
        alignment: new Alignment(0.5, 0.5),
        height: 20.0,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 50.0),
        child: new DropdownButtonHideUnderline(
          child: InputDecorator(
            isEmpty: _selection == null,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              isDense: true,
              hintText: 'ROLE',
            ),
            child: new DropdownButton<String>(
              value: _selection,
              isDense: true,
              items: _items.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (s) {
                setState(() {
                  _selection = s;
                });
              },
            ),
          ),
        ),
      );

  Widget _yourEmail() => new Container(
        alignment: new Alignment(0.5, 0.5),
        height: 46.0,
        margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(4.0)),
            border: new Border.all(color: Colors.white),
            color: Colors.white),
        child: new TextField(
          controller: _lastName,
          decoration: new InputDecoration.collapsed(hintText: "Last name"),
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
            onPressed: register,
            // Navigator.of(context).pushReplacementNamed("/login");

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
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20),
                  child: Text(
                    'Enter your details and click register to complete registration process ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
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
                    Text(
                      'Login information',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
                _user(),
                _pass(),
                _cpass(),
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
                    Text(
                      'Personal information',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
                _yourUserName(),
                _unknown(),
                _yourEmail(),
                loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> register() async {
    print('anserr');
    print(email);
    print(userId);
    var username = _username.text.trim();
    var password = _password.text.trim();
    var cpassword = _cpassword.text.trim();
    var firstname = _firstName.text.trim();
    var lastname = _lastName.text.trim();

    if (username == '' ||
        password == '' ||
        cpassword == '' ||
        firstname == '' ||
        lastname == '') {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text("Please fill all fields"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      );
      showDialog(context: context, child: alertDialog);
    } else if (password != cpassword) {
      AlertDialog alertDialog = new AlertDialog(
        title: new Text("Password mismatch"),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      );
      showDialog(context: context, child: alertDialog);
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        child: new Dialog(
          child: Container(
            height: 100,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: new CircularProgressIndicator(),
                ),
                new Text("Creating Account..."),
              ],
            ),
          ),
        ),
      );
      //get username and email from sharedpreference
      Map body = {
        'UserID': userId.toString(),
        'Email': email,
        'UserName': username,
        'Password': password,
        'RoleName': _selection,
        'FirstName': firstname,
        'LastName': lastname
      };

      await Env().getHeader().then((Map header) {
        var response = http
            .post(Uri.encodeFull("$url/User/Register"),
                headers: header, body: body)
            .then((response) {
          Map responseJson = json.decode(response.body);
          var data = json.decode(response.body);

          if (response.statusCode == 200) {
            Map storeUserRole = {
              'key': 'role',
              'value': json.encode(data['data']['UserDetails'][0]['RoleName'])
            };
            SharedStore().updateStore(storeUserRole);


            if (responseJson.containsKey('message')) {
              Fluttertoast.showToast(
                  msg: responseJson['message'],
                  toastLength: Toast.LENGTH_LONG,
                  bgcolor: '#000000',
                  gravity: ToastGravity.BOTTOM,
                  textcolor: '#FFFFFF');

              new Future<bool>.delayed(new Duration(seconds: 3), () {
                Navigator.pop(context); //pop dialog
                Navigator.of(context).pushNamed("/login");
              });
            }
          } else {
            print(responseJson);
            AlertDialog dialog = new AlertDialog(
              title: new Text("Authentication Failed, Retry Again"),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                )
              ],
            );
            Navigator.pop(context); //pop dialog
            showDialog(context: context, child: dialog);
          }
        });
      });
    }
  }

  _load() async {
    var emailAddress = SharedStore().getEmail().then((response) {
      if (response != null) {
        setState(() {
          email = response;
        });
        print('object');
        print(email);
      }
      return;
    });

    var id = SharedStore().getUserId().then((res) {
      if (res != null) {
        setState(() {
          userId = res;
        });
        print('object');
        print(userId);
      }
      return;
    });
  }
}
