/*import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trial_app/HomeScreen.dart';
import 'Global.dart';
import 'User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//import 'ChatPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage() : super();
  static const String ROUTE_ID = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController;
  TextEditingController _useremailController;
  TextEditingController _userpwdController;

  
  @override
  void initState(){
    super.initState();
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
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 10),
            TextField(
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
              controller: _userpwdController,
              obscureText: true,
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
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //int len = userName.length;
                _loginBtnTap();
              },
            )
          ],
        ),
      ),
    );
  }

  _loginBtnTap() async {
    String userName = _usernameController.text;
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
      "email":userEmail,
      "password": userpwd
    });
    var apiResponse = await http.post(apiEndpoint, body: payload);
    dynamic response = json.decode(apiResponse.body);
    int errors = response['error'];
    String message = response['message'];
    String token;
    showToast(message);

    if(errors==0){
      token = response['token'];   
    }
    storeParam("token", token);
    storeParam("username", userName);

    
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

  void showToast(String param) {
    Fluttertoast.showToast(
        msg: param,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1);
  }
  void storeParam(String key, String valu) async{
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, valu);
  }
}*/