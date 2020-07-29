import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _loading() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Theme.of(context).buttonColor,
            strokeWidth: 4,
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Loading Data...",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomPage() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(children: <Widget>[
        Center(
          child: Text(
            "Restaurant For You".toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight),
          ),
        ),
        Center(
          child: Text(
            "Discover and Share",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Theme.of(context).primaryColorLight),
          ),
        )
      ]),
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColorDark),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          _loading(),
          _bottomPage()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}
