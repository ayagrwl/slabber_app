import 'package:flutter/material.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Create New Group",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: "RobotoItalic",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
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
                Container(
                  padding: EdgeInsets.only(left: 20,right: 0),
                  child: Text(
                    "Create groups by entering a group name and choosing memebers from your friend list.",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            )
            ), 
          )
        ],
      )
    );
  }
}
