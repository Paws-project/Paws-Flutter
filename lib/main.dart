import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paws/providers/Pets.dart';
import 'package:paws/screens/Auth.dart';
import 'package:paws/screens/Main.dart';
import 'package:paws/screens/pet/PetAddForm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class ThemeColors {
  static const creme1 = Color(0xfffff2df);
  static const creme2 = Color(0xffffedd4);
  static const creme3 = Color(0xfff7e0be);
  static const creme10 = Color(0xffc4b59d);

  static const darkGrey = Color(0xFF3E4551);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Pets>(
          create: (context) => Pets(),
        )
      ],
      child: MaterialApp(
        title: 'Paws',

        // Routing
        routes: {
          // Main
          Main.routeName: (ctx) => Main(),
          // Authentication
          SignUp.routeName: (ctx) => SignUp(),
          SignIn.routeName: (ctx) => SignIn(),
          // Pets
          PetAddForm.routeName: (ctx) => PetAddForm(),
        },

        // Theme
        theme: ThemeData(
          // Global
          brightness: Brightness.light,
          primaryColor: ThemeColors.creme1,
          backgroundColor: ThemeColors.creme2,
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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ThemeColors.darkGrey,
          ),
        ),
      ),
    );
  }
}
