import 'package:flutter/material.dart';

class RecentGroupChats extends StatefulWidget {
  @override
  _RecentGroupChatsState createState() => _RecentGroupChatsState();
}

class _RecentGroupChatsState extends State<RecentGroupChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,//Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0,),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 0),
                  child: Text(
                    "Groups which you will create will apear here. Under testing and construction.",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
