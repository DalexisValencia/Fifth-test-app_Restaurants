import 'package:flutter/material.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';

class BookingCardFeatures extends StatelessWidget {
  final String? booking;
  const BookingCardFeatures({
    Key? key,
    this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String restaurantNameInBooking = 'Restaurant';
    return Column(
      children: [
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
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
              text: '12:30 pm',
              textColor: Theme.of(context).primaryColor,
              textSize: 12.5,
              icon: Icons.timer,
              iconColor: Theme.of(context).primaryColor,
              iconSize: 13,
            ),
            CustomChip(
              text: 'Hoy',
              textColor: booking != 'today'
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).buttonColor,
              textSize: 12.5,
              icon: booking != 'today'
                  ? Icons.hourglass_top_rounded
                  : Icons.hourglass_full_rounded,
              iconColor: booking != 'today'
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).buttonColor,
              iconSize: 13,
            ), // assignment_rounded // cuando sea hoy assignment_turned_in
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 1, top: 3),
          child: RichText(
            text: TextSpan(
              text: 'A familiar table ',
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w300,
                  fontSize: 11),
              children: <TextSpan>[
                TextSpan(
                  text: '(4 - 6 persons)',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
