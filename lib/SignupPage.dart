/*import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'ChatUsersScreen.dart';
//import 'Global.dart';
//import 'User.dart';
import 'LoginPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//import 'ChatPage.dart';

class SignupPage extends StatefulWidget {
  SignupPage() : super();
  static const String ROUTE_ID = 'login_page';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _fullnameController;
  TextEditingController _usernameController;
  TextEditingController _useremailController;
  TextEditingController _userpwdController;

  
  @override
  void initState(){
    super.initState();
    _fullnameController = TextEditingController();
    _usernameController = TextEditingController();
    _useremailController = TextEditingController();
    _userpwdController = TextEditingController();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Slabber',
          style: TextStyle(
            letterSpacing: 2,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('./images/childs.png'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _fullnameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 10),TextField(
              controller: _useremailController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              controller: _userpwdController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 5),
            RaisedButton(
              color: Colors.blue.shade600,
              child: Text(
                'Signup',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //int len = userName.length;
                _signUpBtnTap();
              },
            )
          ],
        ),
      ),
    );
  }

  _signUpBtnTap() async {
    String userName = _usernameController.text;
    String fullName = _fullnameController.text;
    String userEmail = _useremailController.text;
    String userpwd = _userpwdController.text;


    if (userName.isEmpty) {
      showToast("Please enter a Username");
    } else if(userEmail.isEmpty){
      showToast("Please enter an Email");
    } else if(userpwd.isEmpty){
      showToast("Please enter a Password");
    }

    final apiEndpoint = 'HOST_URL';
    var payload = json.encode({
      "username": userName,
      "fullname": fullName,
      "gender": "OO",
      "country": "India",
      "email": userEmail,
      "password": userpwd,
    });

    var apiResponse = await http.post(apiEndpoint, body: payload);
    dynamic response = json.decode(apiResponse.body);
    int errors = response['errors'];
    String message = response['message'];
    showToast(message);
    if(errors==0){
      openLoginScreen(context);
    }
  }

  static openLoginScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      LoginPage.ROUTE_ID,
    );
  }

  
  void showToast(String param) {
    Fluttertoast.showToast(
      msg: param,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
    );
  }
}*/