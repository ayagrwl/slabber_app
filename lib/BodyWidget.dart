import 'package:flutter/material.dart';
import 'RecentChats.dart';
import 'RecentGroupChats.dart';
import 'RecentRequests.dart';

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  int selectedIndex = 0;
  final List<String> categories = ['Chats', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context,int index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                   selectedIndex = index;
                  });
               },
               child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10.0,
                  ),
                  child: Text(categories[index],
                    style: TextStyle(
                      color: index == selectedIndex ? Theme.of(context).textSelectionColor/*Colors.white*/ : Theme.of(context).disabledColor/*Colors.white60*/,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.9,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                if (selectedIndex == 0)
                  RecentChats(),
                if (selectedIndex == 1)
                  RecentGroupChats(),
                if (selectedIndex == 2)
                  RecentRequests(),
              ],
            ),
          ),
              ),
      ],
    );
  }
}
