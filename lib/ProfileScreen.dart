import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/theme.dart';
import 'package:trial_app/theme_model.dart';
import 'Global.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  _createAppBar() {
    if(Provider.of<ThemeModel>(context).currentTheme == darkTheme){
      return AppBar(
        elevation: 5.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor,), 
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "My Profile",
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
          "My Profile",
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
      body: Column(
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
                          color: Theme.of(context).iconTheme.color, 
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
                          color: Theme.of(context).textSelectionColor,
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
              color: Theme.of(context).dividerColor,
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
                          color: Theme.of(context).iconTheme.color, 
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
                          color: Theme.of(context).textSelectionColor,
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
              color: Theme.of(context).dividerColor,
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
                          color: Theme.of(context).iconTheme.color, 
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
                          color: Theme.of(context).textSelectionColor,
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
              color: Theme.of(context).dividerColor,
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
                          color: Theme.of(context).iconTheme.color, 
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
                                "Just chill....",
                                style: TextStyle(
                                  color: Theme.of(context).textSelectionColor,
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
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}