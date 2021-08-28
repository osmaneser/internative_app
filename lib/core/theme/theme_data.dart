import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internative_app/core/configs/global_constants.dart';

/**
 * 
 * 
 *  Bu class, referans olarak alınmıştır. 
 *  Flutterda tema işlemlerini öğrenmek için araştırmalarım sonucunda bulduğum kod bloğudur.
 *  Elimden geldiğince bu projeye uyarlamaya çalıştım.
 * 
 * 
 * 
 */

class AppTheme {
  AppTheme._();

  static final TextTheme darkAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 102, color: Color(0xffffffff))),
    headline2: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 64, color: Color(0xffffffff))),
    headline3: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 51, color: Color(0xffffffff))),
    headline4: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 36, color: Color(0xffffffff))),
    headline5: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 25, color: Color(0xffffffff))),
    headline6: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 20, color: Color(0xffffffff))),
    subtitle1: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 17, color: Color(0xffffffff))),
    subtitle2: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 15, color: Color(0xffffffff))),
    bodyText1: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 16, color: Color(0xffffffff))),
    bodyText2: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 14, color: Color(0xffffffff))),
    button: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 15, color: Color(0xffffffff))),
    caption: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 13, color: Color(0xffffffff))),
    overline: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 11, color: Color(0xffffffff))),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 102, color: GlobalConstant.mainColor)),
    headline2: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 64, color: GlobalConstant.mainColor)),
    headline3: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 51, color: GlobalConstant.mainColor)),
    headline4: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 36, color: GlobalConstant.mainColor)),
    headline5: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 25, color: GlobalConstant.mainColor)),
    headline6: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 18, color: GlobalConstant.mainColor)),
    subtitle1: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 17, color: GlobalConstant.mainColor)),
    subtitle2: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 15, color: GlobalConstant.mainColor)),
    bodyText1: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 16, color: GlobalConstant.mainColor)),
    bodyText2: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 14, color: GlobalConstant.mainColor)),
    button: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 15, color: GlobalConstant.mainColor)),
    caption: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 13, color: GlobalConstant.mainColor)),
    overline: GoogleFonts.ibmPlexSans(textStyle: TextStyle(fontSize: 11, color: GlobalConstant.mainColor)),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: Colors.transparent,
    primaryColor: GlobalConstant.mainColor,
    scaffoldBackgroundColor: GlobalConstant.backgroundColor,
    backgroundColor: Color(0xff464c52),
    appBarTheme: AppBarTheme(
      textTheme: darkAppBarTextTheme,
      titleTextStyle: TextStyle(
        color: Colors.white
      ),
      actionsIconTheme: IconThemeData(
        color: GlobalConstant.backgroundColor,
      ),
      color: GlobalConstant.alternativeColor,
      iconTheme: IconThemeData(color: GlobalConstant.mainColor, size: 24),
    ),
    iconTheme: IconThemeData(
      color: GlobalConstant.mainColor,
    ),
    textTheme: darkTextTheme,
    textSelectionTheme: TextSelectionThemeData(cursorColor: GlobalConstant.mainColor, selectionHandleColor: Colors.red),
    indicatorColor: Colors.white,
    disabledColor: Color(0xffa3a3a3),
    highlightColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: GlobalConstant.mainColor.withOpacity(0.5),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white),
      ),
      suffixStyle: TextStyle(),
      border:
          OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(width: 1, color: Colors.white70)),
    ),
    dividerColor: Color(0xffd1d1d1),
    errorColor: Colors.white,
    cardColor: Color(0xff282a2b),
    splashColor: Colors.white.withAlpha(100),
    accentColor: GlobalConstant.mainColor,
    colorScheme: ColorScheme.dark(
      primary: GlobalConstant.mainColor,
      primaryVariant: GlobalConstant.alternativeColor,
      secondary: GlobalConstant.mainColor,
      secondaryVariant: GlobalConstant.mainColor,
      background: GlobalConstant.backgroundColor,
      onPrimary: GlobalConstant.mainColor,
      onBackground: GlobalConstant.alternativeColor,
      onSecondary: GlobalConstant.mainColor.withOpacity(0.7),
      surface: Color(0xff585e63),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
  );

  static ThemeData getThemeFromThemeMode() {
    return darkTheme;
  }
}
