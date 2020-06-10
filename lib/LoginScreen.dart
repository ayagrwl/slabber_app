import 'package:flutter/material.dart';
import 'package:trial_app/HomeScreen.dart';
import 'ChatUsersScreen.dart';
import 'Global.dart';
import 'User.dart';
//import 'dart:math';

class LoginScreen extends StatefulWidget {
  //
  LoginScreen() : super();

  static const String ROUTE_ID = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  TextEditingController _usernameController;
  //TextEditingController _useridController;
  //TextEditingController _useremailController;

  @override
  void initState() {
    super.initState();
    //_useridController = TextEditingController();
    _usernameController = TextEditingController();
    //_useremailController = TextEditingController();
    G.initDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slabber"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            /*TextField(
              controller: _useridController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),*/
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                labelText: "username",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),
            /*TextField(
              controller: _useremailController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),*/
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
                child: Text('LOGIN'),
                onPressed: () {
                  _loginBtnTap();
                })
          ],
        ),
      ),
    );
  }

  _loginBtnTap() async {
    if (_usernameController.text.isEmpty) {
      return;
    }
    
    User me;
    if(_usernameController.text.startsWith('o')){
      me = G.dummyUsers[0];
    } else if(_usernameController.text.startsWith('m')){
      me = G.dummyUsers[1];
    } else if(_usernameController.text.startsWith('a')){
      me = G.dummyUsers[2];
    } else if (_usernameController.text.startsWith('p')) {
      me = G.dummyUsers[3];
    }
    G.loggedInUser = me;
    openHomeScreen(context);
  }

  static openHomeScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      HomeScreen.ROUTE_ID,
    );
  }
}
