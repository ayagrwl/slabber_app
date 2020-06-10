import 'dart:async';
import 'package:flutter/material.dart';
import 'ChatMessageModel.dart';
import 'Global.dart';
import 'SocketUtils.dart';

import 'ChatTitle.dart';
import 'User.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen() : super();
  final String title = "Chat Screen";
  static const String ROUTE_ID = 'chat_screen';
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  TextEditingController _chatTfController;
  List<ChatMessageModel> _chatMessages;
  User _chatUser;
  ScrollController _chatLVController;
  UserOnlineStatus _userOnlineStatus;

  @override
  void initState() {
    super.initState();
    _userOnlineStatus = UserOnlineStatus.connecting;
    _chatLVController = ScrollController(initialScrollOffset: 0.0);
    _chatTfController = TextEditingController();
    _chatUser = G.toChatUser;
    _chatMessages = List();
    _initSocketListeners();
    _checkOnline();
  }

  _initSocketListeners() async {
    G.socketUtils.setOnUserConnectionStatusListener(onUserConnectionStatus);
    G.socketUtils.setOnChatMessageReceivedListener(onChatMessageReceived);
    G.socketUtils.setOnMessageBackFromServer(onMessageBackFromServer);
  }

  _checkOnline() async {
    ChatMessageModel chatMessageModel = ChatMessageModel(
      to: G.toChatUser.id,
      from: G.loggedInUser.id,
    );
    G.socketUtils.checkOnline(chatMessageModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: ChatTitle(
          chatUser: G.toChatUser,
          userOnlineStatus: _userOnlineStatus,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Theme.of(context).buttonColor,//Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => Focus.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _chatList(),
                _bottomChatArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _chatList() {
    return Expanded(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView.builder(
          cacheExtent: 100,
          controller: _chatLVController,
          reverse: false,
          shrinkWrap: true,
          //padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          itemCount: null == _chatMessages ? 0 : _chatMessages.length,
          itemBuilder: (context, index) {
            ChatMessageModel chatMessage = _chatMessages[index];
            return _chatBubble(
              chatMessage,
            );
          },
        ),
      ),
    );
  }

  _bottomChatArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Theme.of(context).backgroundColor,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).buttonColor,
            onPressed: () {},
          ),
          _chatTextArea(),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).buttonColor,
            onPressed: () async {
              _sendButtonTap();
            },
          ),
        ],
      ),
    );
  }

  _chatTextArea() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: _chatTfController,
        decoration: InputDecoration.collapsed(
          hintText: 'Send a message...',
        ),
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _sendButtonTap() async {
    if (_chatTfController.text.isEmpty) {
      return;
    }
    ChatMessageModel chatMessageModel = ChatMessageModel(
      chatId: 0,
      to: _chatUser.id,
      from: G.loggedInUser.id,
      toUserOnlineStatus: false,
      message: _chatTfController.text,
      chatType: SocketUtils.SINGLE_CHAT,
    );
    _addMessage(0, chatMessageModel, _isFromMe(G.loggedInUser));
    _clearMessage();
    G.socketUtils.sendSingleChatMessage(chatMessageModel, _chatUser);
  }

  _clearMessage() {
    _chatTfController.text = '';
  }

  _isFromMe(User fromUser) {
    return fromUser.id == G.loggedInUser.id;
  }

  _chatBubble(ChatMessageModel chatMessageModel) {
    bool fromMe = chatMessageModel.from == G.loggedInUser.id;
    final Container msg = Container(
      margin: fromMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 120.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 120.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.60,
      decoration: fromMe
        ? BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0)),
          )
        : BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
          ),
      child: Align(
        alignment: fromMe ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Text(
              chatMessageModel.message,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
    return msg;
  }

  onChatMessageReceived(data) {
    print('onChatMessageReceived $data');
    if (null == data || data.toString().isEmpty) {
      return;
    }
    ChatMessageModel chatMessageModel = ChatMessageModel.fromJson(data);
    bool online = chatMessageModel.toUserOnlineStatus;
    _updateToUserOnlineStatusInUI(online);
    processMessage(chatMessageModel);
  }

  onMessageBackFromServer(data) {
    ChatMessageModel chatMessageModel = ChatMessageModel.fromJson(data);
    bool online = chatMessageModel.toUserOnlineStatus;
    print('onMessageBackFromServer $data');
    if (!online) {
      print('User not connected');
    }
  }

  onUserConnectionStatus(data) {
    ChatMessageModel chatMessageModel = ChatMessageModel.fromJson(data);
    bool online = chatMessageModel.toUserOnlineStatus;
    _updateToUserOnlineStatusInUI(online);
  }

  _updateToUserOnlineStatusInUI(online) {
    setState(() {
      _userOnlineStatus =
          online ? UserOnlineStatus.online : UserOnlineStatus.not_online;
    });
  }

  processMessage(ChatMessageModel chatMessageModel) {
    _addMessage(0, chatMessageModel, false);
  }

  _addMessage(id, ChatMessageModel chatMessageModel, fromMe) async {
    print('Adding Message to UI ${chatMessageModel.message}');
    setState(() {
      _chatMessages.add(chatMessageModel);
    });
    print('Total Messages: ${_chatMessages.length}');
    _chatListScrollToBottom();
  }

  /// Scroll the Chat List when it goes to bottom
  _chatListScrollToBottom() {
    Timer(Duration(milliseconds: 100), () {
      if (_chatLVController.hasClients) {
        _chatLVController.animateTo(
          _chatLVController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.decelerate,
        );
      }
    });
  }
}

enum UserOnlineStatus { connecting, online, not_online }

/* Alignment alignment = fromMe ? Alignment.topRight : Alignment.topLeft;
    Alignment chatArrowAlignment =
        fromMe ? Alignment.topRight : Alignment.topLeft;
    TextStyle textStyle = TextStyle(
      fontSize: 16.0,
      color: fromMe ? Colors.white : Colors.black54,
    );
    Color chatBgColor = fromMe ? Colors.blue : Colors.black12;
    EdgeInsets edgeInsets = fromMe
        ? EdgeInsets.fromLTRB(5, 5, 15, 5)
        : EdgeInsets.fromLTRB(15, 5, 5, 5);
    EdgeInsets margins = fromMe
        ? EdgeInsets.fromLTRB(80, 5, 10, 5)
        : EdgeInsets.fromLTRB(10, 5, 80, 5);

    return Container(
      color: Colors.white,
      margin: margins,
      child: Align(
        alignment: alignment,
        child: Column(
          children: <Widget>[
            CustomPaint(
              painter: ChatBubble(
                color: chatBgColor,
                alignment: chatArrowAlignment,
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: edgeInsets,
                      child: Text(
                        chatMessageModel.message,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );*/