import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paws/screens/Auth.dart';
import 'package:paws/screens/Main.dart';
import 'package:paws/screens/AddPetScreen.dart';

void main() {
  runApp(MyApp());
}

class ThemeColors {
  static const lightCreme = Color(0xfffff2df);
  static const middleCreme = Color(0xFFffedd4);
  // TODO: darkCreme
  static const darkCreme = Color(0);

  static const darkGrey = Color(0xFF3E4551);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
        title: 'Paws',
        theme: ThemeData(
          // Global
          brightness: Brightness.light,
          primaryColor: ThemeColors.lightCreme,
          backgroundColor: ThemeColors.middleCreme,
          scaffoldBackgroundColor: Color(0xfffff2df),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // Icon-related
          iconTheme: IconThemeData(
            color: ThemeColors.darkGrey,
          ),
          primaryIconTheme: IconThemeData(
            color: ThemeColors.darkGrey,
          ),

          // Input-related
          // Removed deprecated cursorColor attribute
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.amber[600],
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: ThemeColors.darkGrey,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amber[600]),
            ),
          ),

          // Navigation-related
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(
              color: ThemeColors.darkGrey,
            ),
          ),
        ),
        routes: {
          // Main
          Main.routeName: (ctx) => Main(),
          // Authentication
          SignUp.routeName: (ctx) => SignUp(),
          SignIn.routeName: (ctx) => SignIn(),
          // Pets
          AddPetScreen.routeName: (ctx) => AddPetScreen(),
        });
  }
}
