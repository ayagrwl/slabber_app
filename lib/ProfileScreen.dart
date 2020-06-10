import 'package:flutter/material.dart';
import 'Global.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
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
          children: <Widget>[
            SizedBox(height: 30.0,),
            Center(
              child: CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('assets/images/contact.png'), 
              ),
            ),
            SizedBox(height: 60.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 50.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.face),
                        SizedBox(width: 40.0),
                        Text(
                          "Username",
                          style: TextStyle(
                            color: Theme.of(context).accentColor, 
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 65.0,),
                        Text(
                          G.loggedInUser.name,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 50.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.person),
                        SizedBox(width: 40.0),
                        Text(
                          "Full Name",
                          style: TextStyle(
                            color: Theme.of(context).accentColor, 
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 65.0,),
                        Text(
                          G.loggedInUser.name,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 50.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.email),
                        SizedBox(width: 40.0),
                        Text(
                          "Email Address",
                          style: TextStyle(
                            color: Theme.of(context).accentColor, 
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 65.0,),
                        Text(
                          G.loggedInUser.email,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0, right: 30.0 ,top: 20.0, bottom: 20.0),
              child: Divider(
                height: 3.0,
                color: Colors.white,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 50.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.description),
                        SizedBox(width: 40.0),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Theme.of(context).accentColor, 
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 65.0),
                        Container(
                          margin: EdgeInsets.only(right: 20.0),
                          padding: EdgeInsets.all(0.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "HBKJKJB jhjtjtjetjbbbbvbvbbbebsdvaae",
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.justify,
                                  textWidthBasis: TextWidthBasis.longestLine,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 65.0,),
                        Expanded(
                          child: Text(
                            "This is a very long description of the user. Maximum of two lines to be used.....",
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
/*SizedBox(height: 40.0,),
            new Text (
              G.loggedInUser.name,
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Yukari',
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 40.0,),
            new Text (
              G.loggedInUser.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 40.0,),
            new Text (
              G.loggedInUser.email,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.lightBlueAccent,
              ),
            ), */