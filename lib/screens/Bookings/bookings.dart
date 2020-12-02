import 'dart:async';

import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/screens/Bookings/components/bookings__card.dart';
import 'package:fith_app__restaurant/widgets/Navigation/navigation.dart';
import 'package:fith_app__restaurant/widgets/AnimationContainerWrapper.dart';
import 'package:fith_app__restaurant/widgets/Screen__heading.dart';
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
    Timer(
      Duration(
        milliseconds: animationStartTime,
      ),
      () {
        setState(() {
          opacityActive = false;
        });
        startAnimationCustom();
      },
    );
  }

  startAnimationCustom() {
    Timer(
      Duration(
        milliseconds: animationStartTime,
      ),
      () {
        setState(() {
          customAnimationActive = false;
        });
      },
    );
  }

  Widget _body() {
    List<String> allBookingCard = [
      'no-price',
      'price',
      'cancel',
      'today',
      'tomorrow',
      'next-week'
    ];
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ScreenHeading(
                title: 'Booking',
                subtitle: 'Custom your Bookings',
              ),
              Container(
                child: Builder(
                  builder: (BuildContext context) {
                    List<Widget> bookingCards = [];
                    allBookingCard.map((e) {
                      bookingCards.add(
                        BookingsCard(
                          booking: e,
                        ),
                      );
                    }).toList();
                    return Column(
                      children: bookingCards,
                    );
                  },
                ),
              ),
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
      body: AnimatedOpacity(
        duration: Duration(milliseconds: animationOpacityTime),
        opacity: opacityActive ? 0 : 1,
        child: CustomContainerAnimation(
          animationChildren: customAnimationActive,
          children: Column(
            children: <Widget>[
              Navigation(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }
}
