import 'package:flutter/material.dart';
import 'package:trial_app/HomeScreen.dart';
import 'package:trial_app/ProfileScreen.dart';
import 'Global.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: "RobotoItalic",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,//Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )
        ),
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
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        G.loggedInUser.name,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        G.loggedInUser.email,
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 20.0,
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
                color: Theme.of(context).accentColor,
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
                    color: Colors.white,
                    fontSize: 20.0,
                  )
                )
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                SizedBox(width: 40.0),
                Radio(value: 0, groupValue: null, onChanged: null),
                Text(
                  "Dark Theme",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 40.0),
                Radio(value: 0, groupValue: null, onChanged: null),
                Text(
                  "Light Theme",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 40.0),
                Radio(value: 0, groupValue: null, onChanged: null),
                Text(
                  "Warm Theme",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Theme.of(context).hintColor,
                thickness: 1.5,
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
                color: Theme.of(context).hintColor,
                thickness: 1.5,
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
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Theme.of(context).hintColor,
                thickness: 1.5,
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