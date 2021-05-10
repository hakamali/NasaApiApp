import 'package:flutter/material.dart';
import 'package:nasaapi_app/homepage.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Infinity',
      theme: ThemeData(

        primaryColor: Colors.blue

      ),
      home: HomePage(),







    );
  }
}
