// import 'package:fith_app__restaurant/screens/home.dart';
// import 'package:fith_app__restaurant/screens/seacrh.dart';
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
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColorLight: Color(0xFFFBFBFB), // BLANCO
          primaryColor: Color(0xFF7F868A), // GRIS
          primaryColorDark: Color(0xFF686778), // AZUL OSCURO
          buttonColor: Color(0xFFE76D6F), // ROSA,
          accentColor: Color(0xFFC2C2C2), //GRIS CLARO
          cardColor: Color(0xFFEFEFEF),
          hoverColor: Color(0xFFFFB60E), // Amarillo,
          focusColor: Color(0xFF4F57D5), //
          highlightColor: Color(0xFFEFEEF2)),
      home: HomePageScafold(),
      // home: Thema(),
      debugShowCheckedModeBanner: false,
    );
  }
}
