import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/sections/BookingCard.dart';
import 'package:fith_app__restaurant/sections/CustomHeader.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  bool opacityActive = true;
  bool customAnimationActive = true;

  @override
  initState() {
    super.initState();
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        opacityActive = false;
      });
      startAnimationCustom();
    });
  }

  startAnimationCustom() {
    Timer(Duration(milliseconds: animationStartTime), () {
      setState(() {
        customAnimationActive = false;
      });
    });
  }

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

  Widget _wrapperBookingCard() {
    List<String> allBookingCard = [
      'no-price',
      'price',
      'cancel',
      'today',
      'tomorrow',
      'next-week'
    ];
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> bookingCards = [];
          allBookingCard.map((e) {
            bookingCards.add(BookingCard(booking: e));
          }).toList();
          return Column(
            children: bookingCards,
          );
        },
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[BookingTitle(), _wrapperBookingCard()],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: AnimatedOpacity(
          duration: Duration(milliseconds: animationOpacityTime),
          opacity: opacityActive ? 0 : 1,
          child: CustomContainerAnimation(
            animationChildren: customAnimationActive,
            children: Column(
              children: <Widget>[_header(), _body()],
            ),
          ),
          // child: Column(
          //   children: <Widget>[_header(), _body()],
          // ),
        ));
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bookings',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w600),
          ),
          Text('Custom your Bookings',
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w300))
        ],
      ),
    );
  }
}
