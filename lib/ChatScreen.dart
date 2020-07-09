import 'dart:async';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/theme.dart';
import 'package:trial_app/theme_model.dart';
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
  bool isShowSticker;

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
    isShowSticker = false;
  }

  Future<bool> _onWillPop() async {
    if(isShowSticker){
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
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

  _createAppBar() {
    if (Provider.of<ThemeModel>(context).currentTheme == darkTheme) {
      return AppBar(
        elevation: 5.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).buttonColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ChatTitle(
          chatUser: G.toChatUser,
          userOnlineStatus: _userOnlineStatus,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 15.0),
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Theme.of(context).buttonColor,
            onPressed: () {},
          ),
        ],
      );
    } else {
      return GradientAppBar(
        backgroundColorStart: Theme.of(context).hoverColor,
        backgroundColorEnd: Theme.of(context).appBarTheme.color,
        elevation: 5.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).buttonColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: ChatTitle(
          chatUser: G.toChatUser,
          userOnlineStatus: _userOnlineStatus,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 15.0),
            icon: Icon(Icons.more_vert),
            iconSize: 30.0,
            color: Theme.of(context).buttonColor,
            onPressed: () {},
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _chatList(),
            _bottomChatArea(),
            isShowSticker
                ? buildSticker()
                : Container(
                    child: Text(""),
                  ),
          ],
        ),
      ),
    );
  }

  _chatList() {
    return Expanded(
      child: ListView.builder(
        cacheExtent: 100,
        controller: _chatLVController,
        reverse: false,
        shrinkWrap: true,
        itemCount: null == _chatMessages ? 0 : _chatMessages.length,
        itemBuilder: (context, index) {
          ChatMessageModel chatMessage = _chatMessages[index];
          return _chatBubble(
            chatMessage,
          );
        },
      ),
    );
  }

  _bottomChatArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 50.0,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.insert_emoticon),
            iconSize: 25.0,
            color: Theme.of(context).buttonColor,
            onPressed: () {
              setState(() {
                isShowSticker = !isShowSticker;
                FocusScope.of(context).unfocus();
              });
            },
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
        onTap: () => isShowSticker = false,
        textCapitalization: TextCapitalization.sentences,
        controller: _chatTfController,
        cursorColor: Colors.white,
        enableInteractiveSelection: true,
        enableSuggestions: true,
        keyboardAppearance: Brightness.dark,
        minLines: 1,
        maxLines: 2,
        autocorrect: true,
        decoration: InputDecoration.collapsed(
          hintText: 'Type message here ...',
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildSticker() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: EmojiPicker(
        rows: 4,
        columns: 10,
        buttonMode: ButtonMode.MATERIAL,
        onEmojiSelected: (emoji, category) {
          setState(() {
            TextSelection textSelection = _chatTfController.selection;
            _chatTfController.text += emoji.emoji;
            final emojiLength = emoji.emoji.length;
            _chatTfController.selection = textSelection.copyWith(
              baseOffset: textSelection.start + emojiLength,
              extentOffset: textSelection.start + emojiLength
            );
          });
        },
        bgColor: Theme.of(context).scaffoldBackgroundColor,
        indicatorColor: Theme.of(context).indicatorColor,
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
    FocusScope.of(context).unfocus();
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
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width * 0.60,
      decoration: fromMe
          ? BoxDecoration(
              color: /*Theme.of(context).primaryColorLight,*/ Theme.of(context)
                  .primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
            )
          : BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
      child: Align(
        alignment: fromMe ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Text(
              chatMessageModel.message,
              style: TextStyle(
                color: fromMe ? 
                Theme.of(context).textSelectionHandleColor /*Theme.of(context).scaffoldBackgroundColor*/ : 
                Theme.of(context).scaffoldBackgroundColor,
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
