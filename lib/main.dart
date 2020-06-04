import 'package:fith_app__restaurant/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColorLight: Color(0xFFFBFBFB), // BLANCO
        primaryColor: Color(0xFF7F868A), // GRIS 
        primaryColorDark: Color(0xFF182A46), // AZUL OSCURO
        buttonColor: Color(0xFFD97D80), // ROSA
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}