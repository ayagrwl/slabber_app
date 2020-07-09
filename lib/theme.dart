import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Color(0XFF008080),                         //
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Color(0XFF008080),                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Color(0XFF008080),                  //// Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Color(0XFF008080),                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Color(0XFF008080),                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Color(0XFF008080),                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFF008080),                            //// background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFF008080),                    //// background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Color(0XFF008080),                    //// chat screen receivers message
  highlightColor: Colors.white,                             // Search query color
  cursorColor: Colors.grey,                                 // Search non-query color
  backgroundColor: Colors.white54,                          // Color of email in search bar
);

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,         // background color of all the screens, color of sender's text
  accentColor: Colors.black54,                            //Radio button active color
  splashColor: Colors.white,                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Colors.white,                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.black54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Colors.grey,                  //// Divider in profile screen
  textSelectionHandleColor: Colors.black87,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white54,                          // hint text color
  cardTheme: CardTheme(
    color: Colors.white,                         // background color of chat tiles
    shadowColor: Colors.lightBlue,                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.black54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF0078D4),                         // background color of AppBar on all the sreens in dark mode, color of text box in chatscreen, background end color of AppBar on all the screen
    elevation: 5.0,
  ),
  hoverColor: Color(0XFF106EBE),                      // background start color of AppBar on all the screen
  buttonColor: Colors.white,                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Colors.blue,                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Colors.white,                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Colors.black54,
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFF106EBE),                            //// background color of nav drawer header in dark theme, start color of nav drawer in gradient 
    ),
    unselectedIconTheme: IconThemeData(
      color: Color(0XFF0078D4),                           // Ending color of nav drawer in gradient
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFF0078D4),                    //// background color of FAB
    foregroundColor: Colors.white                 // icon on FAB color
  ),
  canvasColor: Colors.grey,                         // background color of requests panel in recent requests
  cardColor: Colors.white,                        // text color on request panel
  primaryColor: Colors.grey,                     // chat screen our message
  primaryColorLight: Color(0XFF0078D4),                    //// chat screen receivers message
  highlightColor: Colors.black,                             // Search query color
  cursorColor: Colors.black45,                                 // Search non-query color
  backgroundColor: Colors.black38,                          // Color of email in search bar
);

ThemeData warmTheme = ThemeData.light().copyWith(
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
    color: Color(0XFFD89002),                         // background color of AppBar on all the sreens in dark mode, color of text box in chatscreen,background end color of AppBar on all the screen
    elevation: 5.0,
  ),
  hoverColor: Color(0XFFEBAB00),                      // background start color of AppBar on all the screen
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
  highlightColor: Colors.black,                             // Search query color
  cursorColor: Colors.grey,                                 // Search non-query color
  backgroundColor: Colors.black38,                          // Color of email in search bar
);


/*
ThemeData blackYellow = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Colors.yellow,
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Colors.yellow,                      // Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Colors.yellowAccent,                  // Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Colors.yellow,                       // border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Colors.yellow,                         // color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Colors.yellow,                             // Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Colors.yellow,                            // background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.yellow,                    // background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Colors.yellow,                    // chat screen receivers message
);



ThemeData powderBlueBlack = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Color(0XFFB0E0E6),                         //
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Color(0XFFB0E0E6),                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Color(0XFFB0E0E6),                  //// Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Color(0XFFB0E0E6),                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Color(0XFFB0E0E6),                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Color(0XFFB0E0E6),                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFFB0E0E6),                            //// background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFFB0E0E6),                    //// background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Color(0XFFB0E0E6),                    //// chat screen receivers message
);



ThemeData darkTurquoiseBlack = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Color(0XFF00CED1),                         //
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Color(0XFF00CED1),                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Color(0XFF00CED1),                  //// Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Color(0XFF00CED1),                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Color(0XFF00CED1),                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Color(0XFF00CED1),                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFF00CED1),                            //// background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFF00CED1),                    //// background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Color(0XFF00CED1),                    //// chat screen receivers message
);

ThemeData lightSeaGreenDark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Color(0XFF20B2AA),                         //
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Color(0XFF20B2AA),                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Color(0XFF20B2AA),                  //// Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Color(0XFF20B2AA),                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Color(0XFF20B2AA),                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Color(0XFF20B2AA),                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFF20B2AA),                            //// background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFF20B2AA),                    //// background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Color(0XFF20B2AA),                    //// chat screen receivers message
);

ThemeData bangladeshiGreenBlack =ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Color(0XFF075E54),                         //
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Color(0XFF075E54),                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Color(0XFF075E54),                  //// Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Color(0XFF075E54),                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Color(0XFF075E54),                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Color(0XFF075E54),                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFF075E54),                            //// background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFF075E54),                    //// background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Color(0XFF075E54),                    //// chat screen receivers message
);

ThemeData tealBlack = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0XFF020202),         // background color of all the screens, color of sender's text
  accentColor: Color(0XFF008080),                         //
  splashColor: Color(0XFFFFFDD3),                     // Slabber appBar title color, app bar title on all pages, chat screen name of persom
  indicatorColor: Color(0XFF008080),                      //// Color of selected tab bar view
  disabledColor: Colors.white54,                      // Color of non-selected tab bar view
  textSelectionColor: Colors.white54,                 // Color of values in profile screen, email subheading in settings screen, theme names in settings screen, chat screen online status
  dividerColor: Color(0XFF008080),                  //// Divider in profile screen
  textSelectionHandleColor: Colors.white70,           // Name heading in settings screen, tile headings in settings
  hintColor: Colors.white38,                          // hint text color
  cardTheme: CardTheme(
    color: Color(0XFF141414),                         // background color of chat tiles
    shadowColor: Color(0XFF008080),                       //// border color of chat tiles
  ),
  secondaryHeaderColor: Colors.white54,               // color of text on chat tiles
  appBarTheme: AppBarTheme(
    color: Color(0XFF141414),                         // background color of AppBar on all the sreens
    elevation: 5.0,
  ),
  buttonColor: Color(0XFF008080),                         //// color of buttons, Hamburger button, arrow_back button
  iconTheme: IconThemeData(
    color: Color(0XFF008080),                             //// Colors of all the icons on Nav drawer, profile page headings
  ),
  navigationRailTheme: NavigationRailThemeData(
    backgroundColor: Color(0XFF141414),                // background color of nav drawer body
    selectedLabelTextStyle: TextStyle(                 // textstyle of text on nav drawer body
      color: Color(0XFFFFFDD3),
      fontFamily: 'RobotoItalic',
      fontSize: 20.0,
    ),
    unselectedLabelTextStyle: TextStyle(               // textstyle of text on nav drwawer header
      letterSpacing: 5,
      fontSize: 50.0,
      color: Color(0XFF141414),
      fontWeight: FontWeight.bold,
      fontFamily: "CartoonistKooky",
    ),
    selectedIconTheme: IconThemeData(
      color: Color(0XFF008080),                            //// background color of nav drawer header
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0XFF008080),                    //// background color of FAB
    foregroundColor: Color(0XFF020202)                 // icon on FAB color
  ),
  canvasColor: Colors.white54,                         // background color of requests panel in recent requests
  cardColor: Color(0XFF020202),                        // text color on request panel
  primaryColor: Color(0XFF323333),                     // chat screen our message
  primaryColorLight: Color(0XFF008080),                    //// chat screen receivers message
);*/