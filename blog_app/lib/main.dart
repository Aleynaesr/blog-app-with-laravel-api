import 'package:blog_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'screens/loading.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1,),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: black, width: 1,),
          ),
          floatingLabelStyle: TextStyle(color: primary),
        ), textSelectionTheme: TextSelectionThemeData(cursorColor: primary),
      ),
      home: Loading(),
    );
  }
}