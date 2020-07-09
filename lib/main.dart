<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/theme_model.dart';
import 'Routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(), child: HomeApp()),
  );
}

class HomeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slabber',
      theme: /*ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0XFFF5F5DC),         // background color of all the screens, color of sender's text
        accentColor: Color(0XFFD89002),                            //Radio button active color
        splashColor: Color(0XFFFCFCFE),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
        indicatorColor: Colors.white,                      //// Color of selected tab bar view
        disabledColor: Colors.white54,                      // Color of non-selected tab bar view
        textSelectionColor: Colors.blueGrey,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
        dividerColor: Colors.black54,                  //// Divider in profile screen
        textSelectionHandleColor: Color(0XFF666699),           // Name heading in settings screen, tile headings in settings
        hintColor: Colors.white54,                          // hint text color
        cardTheme: CardTheme(
          color: Colors.white54,                         // background color of chat tiles
          shadowColor: Color(0XFFEBAB00),                       //// border color of chat tiles
        ),
        secondaryHeaderColor: Colors.blueGrey,               // color of text on chat tiles
        appBarTheme: AppBarTheme(
          color: Color(0XFFD89002),                         // background color of AppBar on all the sreens in dark mode, color of text box in chatscreen
          elevation: 5.0,
        ),
        hoverColor: Color(0XFFEBAB00),                      // background start color of AppBar on all the screen
        cursorColor: Color(0XFFD89002),                // background end color of AppBar on all the screen
        buttonColor: Colors.white,                         //// color of buttons, Hamburger button, arrow_back button
        iconTheme: IconThemeData(
          color: Color(0XFFEBAB00),                             //// Colors of all the icons on Nav drawer, profile page headings
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Color(0XFFF5F5DC),                // background color of nav drawer body
          selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
            color: Colors.blueGrey,
            fontFamily: 'RobotoItalic',
            fontSize: 20.0,
          ),
          unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
            letterSpacing: 5,
            fontSize: 50.0,
            color: Color(0XFFFCFCFE),
            fontWeight: FontWeight.bold,
            fontFamily: "CartoonistKooky",
          ),
          selectedIconTheme: IconThemeData(
            color: Color(0XFFEBAB00),                            //// background color of nav drawer header in dark theme, start color of nav drawer in gradient 
          ),
          unselectedIconTheme: IconThemeData(
            color: Color(0XFFD89002),                           // Ending color of nav drawer in gradient
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0XFFEBAB00),                    //// background color of FAB
          foregroundColor: Colors.white                 // icon on FAB color
        ),
        canvasColor: Colors.blueGrey,                         // background color of requests panel in recent requests
        cardColor: Colors.white,                        // text color on request panel
        primaryColor: Colors.white,                     // chat screen our message
        primaryColorLight: Color(0XFFD89002),                    //// chat screen receivers message
      ),*/Provider.of<ThemeModel>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes(),
      initialRoute: Routes.initScreen(),
    );
  }
=======
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_app/theme_model.dart';
import 'Routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(), child: HomeApp()),
  );
}

class HomeApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slabber',
      theme: /*ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0XFFF5F5DC),         // background color of all the screens, color of sender's text
        accentColor: Color(0XFFD89002),                            //Radio button active color
        splashColor: Color(0XFFFCFCFE),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
        indicatorColor: Colors.white,                      //// Color of selected tab bar view
        disabledColor: Colors.white54,                      // Color of non-selected tab bar view
        textSelectionColor: Colors.blueGrey,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
        dividerColor: Colors.black54,                  //// Divider in profile screen
        textSelectionHandleColor: Color(0XFF666699),           // Name heading in settings screen, tile headings in settings
        hintColor: Colors.white54,                          // hint text color
        cardTheme: CardTheme(
          color: Colors.white54,                         // background color of chat tiles
          shadowColor: Color(0XFFEBAB00),                       //// border color of chat tiles
        ),
        secondaryHeaderColor: Colors.blueGrey,               // color of text on chat tiles
        appBarTheme: AppBarTheme(
          color: Color(0XFFD89002),                         // background color of AppBar on all the sreens in dark mode, color of text box in chatscreen
          elevation: 5.0,
        ),
        hoverColor: Color(0XFFEBAB00),                      // background start color of AppBar on all the screen
        cursorColor: Color(0XFFD89002),                // background end color of AppBar on all the screen
        buttonColor: Colors.white,                         //// color of buttons, Hamburger button, arrow_back button
        iconTheme: IconThemeData(
          color: Color(0XFFEBAB00),                             //// Colors of all the icons on Nav drawer, profile page headings
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Color(0XFFF5F5DC),                // background color of nav drawer body
          selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
            color: Colors.blueGrey,
            fontFamily: 'RobotoItalic',
            fontSize: 20.0,
          ),
          unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
            letterSpacing: 5,
            fontSize: 50.0,
            color: Color(0XFFFCFCFE),
            fontWeight: FontWeight.bold,
            fontFamily: "CartoonistKooky",
          ),
          selectedIconTheme: IconThemeData(
            color: Color(0XFFEBAB00),                            //// background color of nav drawer header in dark theme, start color of nav drawer in gradient 
          ),
          unselectedIconTheme: IconThemeData(
            color: Color(0XFFD89002),                           // Ending color of nav drawer in gradient
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0XFFEBAB00),                    //// background color of FAB
          foregroundColor: Colors.white                 // icon on FAB color
        ),
        canvasColor: Colors.blueGrey,                         // background color of requests panel in recent requests
        cardColor: Colors.white,                        // text color on request panel
        primaryColor: Colors.white,                     // chat screen our message
        primaryColorLight: Color(0XFFD89002),                    //// chat screen receivers message
      ),*/Provider.of<ThemeModel>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes(),
      initialRoute: Routes.initScreen(),
    );
  }
>>>>>>> 5fe3ad133334a894625c1fae1b7a74939ca181c1
}