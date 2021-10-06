import 'dart:async';
import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/tabs/main.tabs.dart';
import 'package:restaurants/screens/splashScreen.dart';
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
        primaryColor: primaryColor,
        primaryColorLight: secondaryColor,
        primaryColorDark: tertiaryColor,
        buttonColor: fourthColor,
        accentColor: fifthColor,
        cardColor: sixthColor,
        hoverColor: seventhColor,
        focusColor: eightColor,
        highlightColor: ninethColor,
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
