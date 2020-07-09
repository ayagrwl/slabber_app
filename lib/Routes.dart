<<<<<<< HEAD
import 'ChatScreen.dart';
import 'LoginScreen.dart';
import 'HomeScreen.dart';
//import 'LoginPage.dart';
import 'RecentChats.dart';

class Routes {
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      HomeScreen.ROUTE_ID: (context) => HomeScreen(),
      ChatScreen.ROUTE_ID: (context) => ChatScreen(),
      //LoginPage.ROUTE_ID: (context) => LoginPage(),
      RecentChats.ROUTE_ID: (context) => RecentChats(),
    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}
=======
import 'ChatScreen.dart';
import 'LoginScreen.dart';
import 'HomeScreen.dart';
//import 'LoginPage.dart';
import 'RecentChats.dart';

class Routes {
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      HomeScreen.ROUTE_ID: (context) => HomeScreen(),
      ChatScreen.ROUTE_ID: (context) => ChatScreen(),
      //LoginPage.ROUTE_ID: (context) => LoginPage(),
      RecentChats.ROUTE_ID: (context) => RecentChats(),
    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}
>>>>>>> 5fe3ad133334a894625c1fae1b7a74939ca181c1
