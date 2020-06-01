import 'package:flutter/material.dart';
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
  TextEditingController _useridController;
  TextEditingController _useremailController;

  @override
  void initState() {
    super.initState();
    _useridController = TextEditingController();
    _usernameController = TextEditingController();
    _useremailController = TextEditingController();
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
            TextField(
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
            ),
            TextField(
              controller: _usernameController,
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
            ),
            TextField(
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
            ),
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
    if (_usernameController.text.isEmpty || _useremailController.text.isEmpty || _useridController.text.isEmpty) {
      return;
    }
    
    User me = User(
      id: int.parse(_useridController.text),
      name: _usernameController.text,
      email: _useremailController.text,
    );

    G.dummyUsers.add(me);

    G.loggedInUser = me;

    openHomeScreen(context);
  }

  static openHomeScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatUsersScreen.ROUTE_ID,
    );
  }
}
