import 'dart:async';
import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/tabs/main.tabs.dart';
import 'package:fith_app__restaurant/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        highlightColor: Color(0xFFEFEEF2),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool splashScreen = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        splashScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return splashScreen
        ? SplashScreen()
        : MultiBlocProvider(
            providers: [
              BlocProvider<CartBloc>(
                create: (context) => CartBloc(),
              ),
              BlocProvider<FavoritesBloc>(
                create: (context) => FavoritesBloc(),
              ),
            ],
            child: MainTabsWrapper(),
          );
  }
}
