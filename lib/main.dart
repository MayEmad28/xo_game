import 'package:flutter/material.dart';
import 'playerNames.dart';
import 'Xo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:playerScreen.routeName ,
      routes: {
        XO.routeName:(context)=>XO(),
        playerScreen.routeName:(context)=>playerScreen(),
      },
    );
  }
}
