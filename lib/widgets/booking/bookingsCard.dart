import 'package:restaurants/constants/contansts.dart';
import 'package:flutter/material.dart';
import 'package:restaurants/widgets/booking/bookingsCard__cancel.dart';
import 'package:restaurants/widgets/booking/bookingsCard__features.dart';
import 'package:restaurants/widgets/booking/bookingsCard__image.dart';

class BookingsCard extends StatefulWidget {
  final String? booking;
  BookingsCard({
    this.booking,
  });
  @override
  _BookingsCardState createState() => _BookingsCardState();
}

class _BookingsCardState extends State<BookingsCard> {
  String restaurantNameInBooking = 'Restaurant';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(
          borderRadiusCards,
        ),
        border: Border.all(
          color: Theme.of(context).primaryColorDark.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
        vertical: 5,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          BookingsCardImage(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              padding: EdgeInsets.fromLTRB(5, 6, 5, 0),
              height: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BookingCardFeatures(
                    booking: widget.booking,
                  ),
                  //RELOJES DE ARENA hourglass_full_rounded hourglass_top_rounded
                  Spacer(),
                  BookingsCardCancel(
                    booking: widget.booking,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
