import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  Widget _header() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width,
      height: defaultHeaderCustomHeight,
      child: CustomHeader(
        firstAction: 'goBack',
        secondAction: 'favorite',
        iconColors: Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BookingTitle(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.blue,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.blue[50],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.blue[100],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Column(
        children: <Widget>[_header(), _body()],
      ),
    );
  }
}

class BookingTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.015,
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      child: Text(
        'Bookings',
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.headline4.copyWith(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
