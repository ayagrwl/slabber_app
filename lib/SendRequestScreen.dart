import 'package:flutter/material.dart';
/*import 'package:testapp/models/message_model.dart';
import 'package:testapp/models/user_model.dart';
import 'chat_screen.dart';*/

class SendRequestScreen extends StatefulWidget {
  @override
  _SendRequestScreenState createState() => _SendRequestScreenState();
}

class _SendRequestScreenState extends State<SendRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Search friend on Slabber",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: "RobotoItalic",
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: Column(
        children: <Widget>[
          Expanded(
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
                    "You will be able to send friend request to Slabber users by searching their username from this screen",
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
          )
        ],
      )
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
    return Card();
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
