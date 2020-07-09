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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10.0),
            Container(
              child: Center (
                child: Text (
                  _connectedToSocket ? "You are Connected" : _errorConnectMessage,
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 15.0,
                    fontFamily: "RobotoItalic",
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
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
                        color: Theme.of(context).cardTheme.color,
                        border: Border.all(
                          width: 0.5,
                          color: Theme.of(context).cardTheme.shadowColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
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
                                      color: Theme.of(context).secondaryHeaderColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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