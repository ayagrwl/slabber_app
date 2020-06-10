import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'SendRequestScreen.dart';
import 'CreateGroupScreen.dart';
import 'BodyWidget.dart';
import 'SettingsScreen.dart';

class HomeScreen extends StatefulWidget {

  static const String ROUTE_ID = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Slabber',
            style: TextStyle(
              fontFamily: 'ActionMan',
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 5.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: (){
              //showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Center(
                child: Text(
                  'SLABBER',
                  style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "CartoonistKooky",
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).canvasColor,//Colors.white70,
                child: ListView (
                  children: <Widget>[
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      ),
                      leading: Icon(Icons.person_pin_circle),
                      title: Text(
                        'My Profile',
                        style: TextStyle(
                          fontFamily: 'RobotoItalic',
                          color: Theme.of(context).hintColor,//Colors.blueGrey,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => SendRequestScreen(),
                        ),
                      ),
                      leading: Icon(Icons.person_add),
                      title: Text(
                        'New Request',
                        style: TextStyle(
                          fontFamily: 'RobotoItalic',
                          color: Theme.of(context).hintColor,//Colors.blueGrey,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroupScreen(),
                        ),
                      ),
                      leading: Icon(Icons.group),
                      title: Text(
                        'New Group',
                        style: TextStyle(
                          fontFamily: 'RobotoItalic',
                          color: Theme.of(context).hintColor,//Colors.blueGrey,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      ),
                      leading: Icon(Icons.settings),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'RobotoItalic',
                          color: Theme.of(context).hintColor,//Colors.blueGrey,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () {

                      },
                      leading: Icon(Icons.settings_power),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'RobotoItalic',
                          color: Theme.of(context).hintColor,//Colors.blueGrey,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: BodyWidget(),
    );
  }
}

/*class DataSearch extends SearchDelegate<String> {

  final listName = ['James','Olivia','John','Sophia','Steven','Sam','Greg'];
  final favListName = ['James','Olivia'];
  List<User> list= [james,olivia,john,sophia,steven,sam,greg];
  List<User> favList= [james,olivia];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(
        Icons.clear,
      ),
      onPressed: () {
        query = "";
      },
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? favListName
        : listName.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        onTap: () {
          for (var i=0;i<list.length;i++){
            if(list[i].name==suggestionList[index]){
              Navigator.push(context,MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: list[i],
                )
              ),
              );
            }
          }
        },
        leading: Icon(Icons.contact_phone),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey)
          ),],
        ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }

}*/