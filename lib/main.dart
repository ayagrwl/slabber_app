import 'package:flutter/material.dart';
import 'Routes.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slabber',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: Routes.routes(),
      initialRoute: Routes.initScreen(),
    );
  }
}
/*ThemeData(
        primaryColor: Colors.cyan,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.orangeAccent,//Color(0xFFFEF9EB),
        accentColorBrightness: Brightness.dark,
      ),*/