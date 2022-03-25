import 'package:flutter/material.dart';

class BookingsCardCancel extends StatelessWidget {
  final String? booking;
  const BookingsCardCancel({
    Key? key,
    this.booking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: booking != 'no-price'
              ? Text(
                  "\$12.000",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).buttonColor,
                      ),
                )
              : Text(""),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: MaterialButton(
            disabledColor: Theme.of(context).primaryColorDark.withAlpha(100),
            color: Theme.of(context).buttonColor,
            height: 25,
            padding: EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: booking != 'today' ? () {} : null,
            onHighlightChanged: (val) {},
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: booking != 'today'
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColorDark,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
