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
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width*0.9,
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0,left: 30.0),
                  child: Text(
                    "Received Requests",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 15.0, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              /*ListView.builder(
                itemBuilder: null
              ),*/
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width*0.9,
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0,left: 30.0),
                  child: Text(
                    "Sent Requests",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 15.0, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              /*ListView.builder(
                itemBuilder: null
              ),*/
            ],
          ),
        )
      ),
    );
  }
}
