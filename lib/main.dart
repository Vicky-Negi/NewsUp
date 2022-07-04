import 'package:flutter/material.dart';
import 'package:newsup/pages/home.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'NewsUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: Home(),

    );
  }
}