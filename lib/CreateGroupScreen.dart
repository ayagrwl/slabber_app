import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/theme.dart';
import 'package:trial_app/theme_model.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {

  _createAppBar() {
    if(Provider.of<ThemeModel>(context).currentTheme == darkTheme) {
      return AppBar(
        elevation: 5.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).buttonColor,), 
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Create New Group",
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
          "Create New Group",
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
          children: <Widget>[
            SizedBox(height: 30.0,),
            Container(
              padding: EdgeInsets.only(left: 20,right: 0),
              child: Text(
                "Create groups by entering a group name and choosing memebers from your friend list.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
