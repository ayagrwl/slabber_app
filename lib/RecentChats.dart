import 'package:flutter/material.dart';
import 'Global.dart';
import 'User.dart';
import 'ChatScreen.dart';


class RecentChats extends StatefulWidget {
  RecentChats() : super();
  static const String ROUTE_ID = "recent_chats_widget";

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  
  List<User> _chatUsers;
  bool _connectedToSocket;
  String _errorConnectMessage;

  @override
  void initState() {
    super.initState();
    _chatUsers = G.getUsersFor(G.loggedInUser);
    _connectedToSocket = false;
    _errorConnectMessage = "You are Connecting...";
    _connectSocket();
  }

  _connectSocket() {
    Future.delayed(Duration(seconds: 2), () async {
      print(
          "Connecting Logged In User: ${G.loggedInUser.name}, ID: ${G.loggedInUser.id}");
      G.initSocket();
      await G.socketUtils.initSocket(G.loggedInUser);
      G.socketUtils.connectToSocket();
      G.socketUtils.setConnectListener(onConnect);
      G.socketUtils.setOnDisconnectListener(onDisconnect);
      G.socketUtils.setOnErrorListener(onError);
      G.socketUtils.setOnConnectionErrorListener(onConnectError);
    });
  }

  /*static openLoginScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      LoginScreen.ROUTE_ID,
    );
  }*/

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
                Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )
                  ),
                  child: Center (
                    child: Text (
                      _connectedToSocket ? "You are Connected" : _errorConnectMessage,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                        fontFamily: "RobotoItalic",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _chatUsers.length,
                    itemBuilder: (context,index){
                      User user = _chatUsers[index];
                      return GestureDetector(
                        onTap: () {
                          G.toChatUser = user;
                          openChatScreen(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,//Color(0xFFFFEFEE),
                              //color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          child: Row(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: AssetImage("assets/images/contact.png"),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        user.name,
                                        style: TextStyle(
                                          color: Theme.of(context).hintColor,//Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      /*SizedBox(height: 5.0),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.45,
                                        child: Text(
                                          chat.text,
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )*/
                                    ],
                                  ),
                                ],
                              ),
                              /*Column(children: <Widget>[
                                Text(
                                  chat.time,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                chat.unread ? Container(
                                  width: 40.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                                    : SizedBox.shrink(),
                              ],),*/
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static openChatScreen(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      ChatScreen.ROUTE_ID,
    );
  }

  onConnect(data) {
    print('Connected $data');
    setState(() {
      _connectedToSocket = true;
    });
  }

  onConnectError(data) {
    print('onConnectError $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Failed to Connect';
    });
  }

  onConnectTimeout(data) {
    print('onConnectTimeout $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Connection timedout';
    });
  }

  onError(data) {
    print('onError $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Connection Failed';
    });
  }

  onDisconnect(data) {
    print('onDisconnect $data');
    setState(() {
      _connectedToSocket = false;
      _errorConnectMessage = 'Disconnected';
    });
  }
}