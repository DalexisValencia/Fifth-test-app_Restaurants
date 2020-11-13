import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/CustomChip.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatefulWidget {
  final String booking;
  BookingCard({this.booking});
  @override
  _BookingCardState createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  String restaurantNameInBooking = 'Restaurant';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(borderRadiusCards),
          border: Border.all(
              color: Theme.of(context).primaryColorDark.withOpacity(0.5),
              width: 0.5)),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding,
          vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.30,
            height: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusImages),
                color: Colors.black,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/banner/fast-food.png'))),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              padding: EdgeInsets.fromLTRB(5, 6, 5, 0),
              height: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.local_dining_rounded,
                        size: 17,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          //hay que hacer una validación cuando el elemento no es mayor al numero de caracteres a cortar
                          restaurantNameInBooking.length > 14
                              ? restaurantNameInBooking.substring(0, 14) + '...'
                              : restaurantNameInBooking,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: <Widget>[
                      CustomChip(
                          name: '12:30 pm',
                          nameColor: Theme.of(context).primaryColor,
                          icon: Icons.timer,
                          iconColor: Theme.of(context).primaryColor),
                      CustomChip(
                          name: 'Hoy',
                          nameColor: widget.booking != 'today'
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).buttonColor,
                          icon: widget.booking != 'today'
                              ? Icons.hourglass_top_rounded
                              : Icons.hourglass_full_rounded,
                          iconColor: widget.booking != 'today'
                              ? Theme.of(context).primaryColor
                              : Theme.of(context)
                                  .buttonColor), // assignment_rounded // cuando sea hoy assignment_turned_in
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1, top: 3),
                    child: RichText(
                      text: TextSpan(
                          text: 'A familiar table ',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.w300,
                              fontSize: 11),
                          children: <TextSpan>[
                            TextSpan(
                                text: '(4 - 6 persons)',
                                style: TextStyle(fontWeight: FontWeight.w500))
                          ]),
                    ),
                  ),
                  //RELOJES DE ARENA hourglass_full_rounded hourglass_top_rounded
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: widget.booking != 'no-price'
                            ? Text("\$12.000",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).buttonColor))
                            : Text(""),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(
                            disabledColor: Theme.of(context)
                                .primaryColorDark
                                .withAlpha(100),
                            color: Theme.of(context).buttonColor,
                            height: 25,
                            padding: EdgeInsets.all(0),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            onPressed: widget.booking != 'today' ? () {} : null,
                            onHighlightChanged: (val) {},
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: widget.booking != 'today'
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).primaryColorDark),
                            ),
                          ))
                    ],
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
