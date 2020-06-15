import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/Global.dart';
import 'package:trial_app/RecentChats.dart';
import 'package:trial_app/RecentGroupChats.dart';
import 'package:trial_app/RecentRequests.dart';
import 'package:trial_app/User.dart';
import 'package:trial_app/theme.dart';
import 'package:trial_app/theme_model.dart';
import 'ChatScreen.dart';
import 'ProfileScreen.dart';
import 'CreateGroupScreen.dart';
import 'SettingsScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE_ID = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  
  
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    bool isOk = Provider.of<ThemeModel>(context).currentTheme == darkTheme;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 5.0,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Center(
                child: Text(
                  'SLABBER',
                  style: Theme.of(context).navigationRailTheme.unselectedLabelTextStyle,
                ),
              ),
              decoration: isOk ?
              BoxDecoration(color: Theme.of(context).navigationRailTheme.selectedIconTheme.color,) : 
              BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).navigationRailTheme.selectedIconTheme.color,
                    Theme.of(context).navigationRailTheme.unselectedIconTheme.color
                  ]
                )
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).navigationRailTheme.backgroundColor,
                child: ListView (
                  children: <Widget>[
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      ),
                      leading: Icon(Icons.person_pin_circle, color: Theme.of(context).iconTheme.color,),
                      title: Text(
                        'My Profile',
                        style: Theme.of(context).navigationRailTheme.selectedLabelTextStyle,
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () {
                        showSearch(context: context, delegate: UserSearch());
                      },
                      leading: Icon(Icons.person_add, color: Theme.of(context).iconTheme.color,),
                      title: Text(
                        'New Request',
                        style: Theme.of(context).navigationRailTheme.selectedLabelTextStyle,
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => CreateGroupScreen(),
                        ),
                      ),
                      leading: Icon(Icons.group, color: Theme.of(context).iconTheme.color,),
                      title: Text(
                        'New Group',
                        style: Theme.of(context).navigationRailTheme.selectedLabelTextStyle,
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      ),
                      leading: Icon(Icons.settings, color: Theme.of(context).iconTheme.color,),
                      title: Text(
                        'Settings',
                        style: Theme.of(context).navigationRailTheme.selectedLabelTextStyle,
                      ),
                    ),
                    new ListTile(
                      contentPadding: EdgeInsets.only(left: 40.0),
                      onTap: () {

                      },
                      leading: Icon(Icons.settings_power, color: Theme.of(context).iconTheme.color,),
                      title: Text(
                        'Logout',
                        style: Theme.of(context).navigationRailTheme.selectedLabelTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      
      appBar: _createAppBar(),
      
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          RecentChats(),
          RecentGroupChats(),
          RecentRequests()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(Icons.message, color: Theme.of(context).floatingActionButtonTheme.foregroundColor,),
        onPressed: null,
      ),
    );
  }

  _createAppBar(){
    if(Provider.of<ThemeModel>(context).currentTheme == darkTheme){
      return AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu, color: Theme.of(context).buttonColor,), 
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }
              ),
              title: Center(
                child: Text(
                  'Slabber',
                  style: TextStyle(
                    fontFamily: 'ActionMan',
                    color: Theme.of(context).splashColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              elevation: 10.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Theme.of(context).buttonColor,
                  onPressed: (){
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).indicatorColor,
                labelColor: Theme.of(context).indicatorColor,
                unselectedLabelColor: Theme.of(context).disabledColor,
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
                tabs: <Widget>[
                  Tab(text: "CHATS"),
                  Tab(text: "GROUPS",),
                  Tab(text: "REQUESTS"),
                ]
              ),
            );
    } else {
        return GradientAppBar(
              backgroundColorStart: Theme.of(context).hoverColor,
              backgroundColorEnd: Theme.of(context).appBarTheme.color,
              leading: IconButton(
                icon: Icon(Icons.menu, color: Theme.of(context).buttonColor,), 
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }
              ),
              title: Center(
                child: Text(
                  'Slabber',
                  style: TextStyle(
                    fontFamily: 'ActionMan',
                    color: Theme.of(context).splashColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              elevation: 10.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Theme.of(context).buttonColor,
                  onPressed: (){
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).indicatorColor,
                labelColor: Theme.of(context).indicatorColor,
                unselectedLabelColor: Theme.of(context).disabledColor,
                labelStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
                tabs: <Widget>[
                  Tab(text: "CHATS"),
                  Tab(text: "GROUPS",),
                  Tab(text: "REQUESTS"),
                ]
              ),
            );
    }
  }
}

class DataSearch extends SearchDelegate<String> {

  List<User> list = G.dummyUsers;
  List<User> favList = G.dummyUsers;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(
        Icons.clear,
        color: Theme.of(context).buttonColor,
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
        color: Theme.of(context).buttonColor,
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
    List<User> suggestionList;/* = query.isEmpty ? favList.
        : listName.where((p) => p.startsWith(query)).toList();*/
    if(query.isEmpty) {
      if(favList.isNotEmpty){
        suggestionList = favList;
      } else {
        return ListView(
          children: <Widget>[
            ListTile(
              title: Text("You haven't added any friends yet..."),
            ),
          ],
        );
      }
    } else {
      suggestionList = list.where((p) => p.name.toLowerCase().startsWith(query)).toList();
    }

    suggestionList.remove(G.loggedInUser);
    
    return ListView.builder(
      itemBuilder: (context,index) => Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(vertical: 2.0),
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(),
        child: ListTile(
          onTap: () {
            G.toChatUser = suggestionList[index];
            openChatScreen(context);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/contact.png"),
            radius: 20.0,
          ),
          title: RichText(text: TextSpan(
            text: suggestionList[index].name.substring(0,query.length),
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.bold,
            ),
            children: [TextSpan(
                text: suggestionList[index].name.substring(query.length),
                style: TextStyle(color: Theme.of(context).cursorColor)
            ),],
          ),
          ),
          subtitle: Text(
            suggestionList[index].email,
            style: TextStyle(
              color: Theme.of(context).backgroundColor, 
            ),
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
  static openChatScreen(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      ChatScreen.ROUTE_ID,
    );
  }
}


class UserSearch extends SearchDelegate<String> {
  List<User> list = G.dummyUsers;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(
        Icons.clear,
        color: Theme.of(context).buttonColor,
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
        color: Theme.of(context).buttonColor,
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
    List<User> suggestionList;
    if(query.isEmpty){
      return ListView(
        children: <Widget>[
          ListTile(
            title: Center(
              child: Text(
                "You haven't entered anything..."
              ),
            ),
          ),
        ],
      );
    } else{
      suggestionList = list.where((p) => p.name.toLowerCase().startsWith(query)).toList();
    }

    suggestionList.remove(G.loggedInUser);
    
    return ListView.builder(
      itemBuilder: (context,index) => Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(vertical: 2.0),
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(),
        child: ListTile(
          onTap: () {
            G.toChatUser = suggestionList[index];
            openChatScreen(context);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/contact.png"),
            radius: 20.0,
          ),
          title: RichText(text: TextSpan(
            text: suggestionList[index].name.substring(0,query.length),
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.bold,
            ),
            children: [TextSpan(
                text: suggestionList[index].name.substring(query.length),
                style: TextStyle(color: Theme.of(context).cursorColor)
            ),],
          ),
          ),
          subtitle: Text(
            suggestionList[index].email,
            style: TextStyle(
              color: Theme.of(context).backgroundColor, 
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.person_add, color: Theme.of(context).iconTheme.color,), 
            onPressed: null
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
  static openChatScreen(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      ChatScreen.ROUTE_ID,
    );
  }
}