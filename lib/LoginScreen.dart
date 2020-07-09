import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/HomeScreen.dart';
import 'package:trial_app/theme.dart';
import 'package:trial_app/theme_model.dart';
import 'Global.dart';
import 'User.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();
  static const String ROUTE_ID = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  TextEditingController _usernameController;

  @override
  void initState(){
    super.initState();
    _usernameController = TextEditingController();
    G.initDummyUsers();
  }

  _createAppBar() {
    if(Provider.of<ThemeModel>(context).currentTheme == darkTheme){
      return AppBar(
        title: Text("Slabber"),
      );
    } else {
      return GradientAppBar(
        backgroundColorStart: Theme.of(context).hoverColor,
        backgroundColorEnd: Theme.of(context).cursorColor,
        title: Text("Slabber"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
                fillColor: Theme.of(context).primaryColor,
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
