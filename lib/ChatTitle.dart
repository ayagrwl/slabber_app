import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'User.dart';

class ChatTitle extends StatelessWidget {
  //
  const ChatTitle({
    Key key,
    @required this.chatUser,
    @required this.userOnlineStatus,
  }) : super(key: key);

  final User chatUser;
  final UserOnlineStatus userOnlineStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/contact.png"),
            backgroundColor: Colors.black,
            radius: 20.0,
          ),
          SizedBox (
            width: 20.0,
          ),
          Column (
            children: <Widget>[
              SizedBox(height: 3.0),
              Text(
                chatUser.name,
                style: TextStyle(
                  color:Theme.of(context).hintColor,//Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.0,),
              Text (
                _getStatusText(),
                style: TextStyle(
                  fontSize: 15.0,
                  color: Theme.of(context).disabledColor,//Colors.white70,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _getStatusText() {
    if (userOnlineStatus == UserOnlineStatus.connecting) {
      return 'connecting...';
    }
    if (userOnlineStatus == UserOnlineStatus.online) {
      return 'online';
    }
    if (userOnlineStatus == UserOnlineStatus.not_online) {
      return 'not online';
    }
  }
}


/*children: <Widget>[
          Text(chatUser.name),
          Text(
            _getStatusText(),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
            ),
          )
        ],*/
