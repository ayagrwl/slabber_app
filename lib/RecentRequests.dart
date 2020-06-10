import 'package:flutter/material.dart';

class RecentRequests extends StatefulWidget {
  @override
  _RecentRequestsState createState() => _RecentRequestsState();
}

class _RecentRequestsState extends State<RecentRequests> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    "Requests sent and requests received will be displayed here.",
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
    );
  }
}
