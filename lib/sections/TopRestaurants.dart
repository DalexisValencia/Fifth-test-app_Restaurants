import 'package:fith_app__restaurant/widgets/iconAndText.dart';
import 'package:flutter/material.dart';

class MainTopRestaurant extends StatefulWidget {
  @override
  _MainTopRestaurantState createState() => _MainTopRestaurantState();
}

class _MainTopRestaurantState extends State<MainTopRestaurant> {
  Widget _cardHeader() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  width: 0.6))),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.010),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'House of Blues san diego',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'address direction or description',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 10,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.restaurant_menu,
                size: 20,
                color: Theme.of(context).primaryColorLight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconAndText(
            icon: Icons.star,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 14,
            text: '4.8 votes',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
          ),
          IconAndText(
            icon: Icons.timer,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 14,
            text: '30 minutes',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
          ),
          IconAndText(
            icon: Icons.format_align_right,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 14,
            text: 'Agenda',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.33,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/populars/Salade-Niçoise.jpg'))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: -5,
              left: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.10) * 3,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.07),
                child: Column(
                  children: <Widget>[
                    _cardHeader(),
                    _cardBody(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
