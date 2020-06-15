import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/HomeScreen.dart';
import 'package:trial_app/ProfileScreen.dart';
import 'package:trial_app/theme.dart';
import 'package:trial_app/theme_model.dart';
import 'Global.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  int radioValue;

  _handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
      switch(radioValue) {
        case 0:
          Provider.of<ThemeModel>(context).toggleTheme(0);
          break;
        case 1:
          Provider.of<ThemeModel>(context).toggleTheme(1);
          break;
        case 2:
          Provider.of<ThemeModel>(context).toggleTheme(2);
          break;
        default:
          Provider.of<ThemeModel>(context).toggleTheme(0);
      }
    });
  }

  _createAppBar() {
    if(Provider.of<ThemeModel>(context).currentTheme == darkTheme){
      return AppBar(
        elevation: 5.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor,), 
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).splashColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
        return GradientAppBar(
          backgroundColorStart: Theme.of(context).hoverColor,
              backgroundColorEnd: Theme.of(context).appBarTheme.color,
        elevation: 5.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor,), 
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).splashColor,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 25.0,),
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage('assets/images/contact.png'),
                    //backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        G.loggedInUser.name,
                        style: TextStyle(
                          color: Theme.of(context).textSelectionHandleColor,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        G.loggedInUser.email,
                        style: TextStyle(
                          color: Theme.of(context).textSelectionColor,
                          fontSize: 15.0,
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 20.0,
                color: Theme.of(context).dividerColor,
                thickness: 2.0,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 35.0),
                Icon(Icons.colorize),
                SizedBox(width: 20.0),
                Text(
                  "Theme",
                  style: TextStyle(
                    color: Theme.of(context).textSelectionHandleColor,
                    fontSize: 20.0,
                  )
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                SizedBox(width: 40.0),
                Radio(value: 0, groupValue: radioValue, onChanged: _handleRadioValueChange,
                activeColor: Theme.of(context).accentColor,focusColor: Theme.of(context).textSelectionColor,hoverColor: Theme.of(context).textSelectionColor,),
                Text(
                  "Dark Theme",
                  style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 40.0),
                Radio(value: 1, groupValue: radioValue, onChanged: _handleRadioValueChange,
                activeColor: Theme.of(context).accentColor,focusColor: Theme.of(context).textSelectionColor,hoverColor: Theme.of(context).textSelectionColor,),
                Text(
                  "Light Theme",
                  style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 40.0),
                Radio(value: 2, groupValue: radioValue, onChanged: _handleRadioValueChange,
                activeColor: Theme.of(context).accentColor,focusColor: Theme.of(context).textSelectionColor,hoverColor: Theme.of(context).textSelectionColor,),
                Text(
                  "Warm Theme",
                  style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Theme.of(context).dividerColor,
                thickness: 0.5,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 35.0),
                  Icon(Icons.person),
                  SizedBox(width: 20.0),
                  Text(
                    "Friends List",
                    style: TextStyle(
                      color: Theme.of(context).textSelectionHandleColor,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Theme.of(context).dividerColor,
                thickness: 0.5,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 35.0),
                  Icon(Icons.group),
                  SizedBox(width: 20.0),
                  Text(
                    "Groups List",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textSelectionHandleColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Theme.of(context).dividerColor,
                thickness: 0.5,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 35.0),
                  Icon(Icons.settings_power),
                  SizedBox(width: 20.0),
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textSelectionHandleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

