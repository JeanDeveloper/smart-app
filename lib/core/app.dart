import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/presentation/screens/splash/splash_screen.dart';
import 'package:smart/presentation/theme/theme.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final _borderLight = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        color: SmartColors.lightGrey,
        width: 2,
        style: BorderStyle.solid
      )
    );

    final _borderDark = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: SmartColors.grey,
        // width: 2,
        style: BorderStyle.solid
      )
    );

    final lightTheme = ThemeData(

      appBarTheme: AppBarTheme(
        color: SmartColors.white,
        iconTheme: const IconThemeData(
          color: SmartColors.blue
        ),
        titleTextStyle: GoogleFonts.poppins().copyWith(
          color: SmartColors.blue, 
          fontWeight: FontWeight.bold,
        )
      ),

      canvasColor: SmartColors.white,
      disabledColor: SmartColors.grey,
      accentColor: SmartColors.blue,
      dividerColor: SmartColors.veryLightGrey,

      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: SmartColors.blue,
        displayColor: SmartColors.blue,
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        border: _borderLight,
        enabledBorder: _borderLight,
        focusedBorder: _borderLight,
        labelStyle: const TextStyle(color: SmartColors.blue),
        hintStyle: GoogleFonts.poppins(
          color: SmartColors.grey,
          fontSize: 10
        ),
      ),

      iconTheme: const  IconThemeData(
        color: SmartColors.blue,
      ),

    );

    final darkTheme = ThemeData(
      hintColor: SmartColors.white,
      appBarTheme: AppBarTheme(
        color: SmartColors.blue,
        titleTextStyle: GoogleFonts.poppins().copyWith(
          fontSize: 20,
          color: SmartColors.white,
          fontWeight: FontWeight.bold
        )
      ),
      dividerColor: Colors.transparent,
      accentColor: SmartColors.white,
      canvasColor: SmartColors.grey,
      disabledColor: SmartColors.white,
      scaffoldBackgroundColor: SmartColors.dark,
      textTheme: GoogleFonts.poppinsTextTheme().apply( bodyColor: SmartColors.green, displayColor: SmartColors.green ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: SmartColors.grey,
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        labelStyle: const TextStyle(color: SmartColors.white),
        hintStyle: GoogleFonts.poppins( 
          color: SmartColors.white,
          fontSize: 10
        ),
      ),
      iconTheme: const IconThemeData(
        color: SmartColors.white,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart App',
      theme: lightTheme,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );

  }
}

