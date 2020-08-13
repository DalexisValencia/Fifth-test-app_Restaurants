import 'dart:async';
import 'package:fith_app__restaurant/blocs/navigations.dart';
import 'package:fith_app__restaurant/screens/main.tabs.dart';
import 'package:fith_app__restaurant/screens/splashScreen.dart';
import 'package:fith_app__restaurant/blocs/navigations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorBloc = new BlocNavigations();
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
      // home: TestBlocPattern(),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestBlocPattern extends StatefulWidget {
  @override
  _TestBlocPatternState createState() => _TestBlocPatternState();
}

class _TestBlocPatternState extends State<TestBlocPattern> {
  final navigatorBloc = new BlocNavigations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder(
        initialData: navigatorBloc.initial,
        stream: navigatorBloc.streamprevious,
        builder: (context, snapshot) {
          print(snapshot.data);
          return Column(
            children: <Widget>[
              Container(child: Text("${snapshot.data}")),
              RaisedButton(
                child: Text("cambiar a otro"),
                onPressed: () {
                  print("el click");
                  navigatorBloc.setPreviousPage("Tab 1");
                },
              ),
              RaisedButton(
                child: Text("cambiar a otro"),
                onPressed: () {
                  print("el click");
                  navigatorBloc.setPreviousPage("Tab 2");
                },
              )
            ],
          );
        },
      ),
    ));
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
    return splashScreen ? SplashScreen() : MainTabsWrapper();
  }
}
