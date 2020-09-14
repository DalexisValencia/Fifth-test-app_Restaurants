import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/sections/EmptySection.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:fith_app__restaurant/widgets/iconAndText.dart';
import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:flutter/material.dart';

class MainTopRestaurant extends StatefulWidget {
  final Restaurants restaurant;
  MainTopRestaurant({this.restaurant});
  @override
  _MainTopRestaurantState createState() => _MainTopRestaurantState();
}

class _MainTopRestaurantState extends State<MainTopRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            RestaurantTopSummary(resturant: widget.restaurant),
            FullSectionTitle(
              title: 'Menu Related of ${widget.restaurant.name}',
              rightContainer:
                  RoundedCustomButton(title: 'See all', callPressed: () {}),
            ),
            widget.restaurant.menu.length >= 1
                ? RelatedProductsInThisRestaurant(menu: widget.restaurant.menu)
                : Container(
                    margin: EdgeInsets.only(
                        right:
                            MediaQuery.of(context).size.width * defaultPadding),
                    child: EmptySections(),
                  ),
            Container(
              margin: EdgeInsets.only(
                  top: 20,
                  right: MediaQuery.of(context).size.width * defaultPadding,
                  bottom: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).accentColor, width: 1))),
            )
            // widget.restaurant.menu.length >= 1
            //     ? Container(
            //         margin: EdgeInsets.only(
            //             top: 20,
            //             right:
            //                 MediaQuery.of(context).size.width * defaultPadding,
            //             bottom: 20),
            //         decoration: BoxDecoration(
            //             border: Border(
            //                 bottom: BorderSide(
            //                     color: Theme.of(context).buttonColor,
            //                     width: 3))),
            //       )
            //     : Text("")
          ],
        ));
  }
}

class RestaurantTopSummary extends StatefulWidget {
  final Restaurants resturant;
  RestaurantTopSummary({this.resturant});
  @override
  _RestaurantTopSummaryState createState() => _RestaurantTopSummaryState();
}

class _RestaurantTopSummaryState extends State<RestaurantTopSummary> {
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
                        widget.resturant.name,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.resturant.description.substring(0, 20) + "...",
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
                Icons.restaurant,
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
            text: '${widget.resturant.rating} stars',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
          ),
          IconAndText(
            icon: Icons.location_on,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 14,
            text: '${widget.resturant.distance}',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
          ),
          Material(
            child: InkWell(
              splashColor: Colors.red,
              onTap: () {
                print('Reservar');
              },
              child: IconAndText(
                icon: Icons.assignment,
                iconColor: Theme.of(context).primaryColorDark,
                iconSize: 14,
                text: 'Reserve',
                textColor: Theme.of(context).primaryColorDark,
                textSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    print(widget.resturant);
    return Container(
      margin: EdgeInsets.only(right: withDefaultPadding, bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/banner/mexican-food.png'))),
      child: MaterialButton(
        elevation: 0,
        color: Colors.transparent,
        splashColor: Theme.of(context).buttonColor,
        child: Stack(
          children: <Widget>[
            Positioned(
                bottom: -5,
                left: withDefaultPadding - 12,
                child: Container(
                  width: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.10) * 3,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: withDefaultPadding),
                  child: Column(
                    children: <Widget>[
                      _cardHeader(),
                      _cardBody(),
                    ],
                  ),
                )),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class RelatedProductsInThisRestaurant extends StatelessWidget {
  final List<Dishes> menu;
  RelatedProductsInThisRestaurant({this.menu});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.07,
          top: MediaQuery.of(context).size.width * 0.02),
      child: Builder(builder: (BuildContext context) {
        List<Widget> nextTops = [];
        menu.map((e) {
          nextTops.add(QuickView(
            dish: e,
          ));
        }).toList();
        return Column(
          children: nextTops,
        );
      }),
    );
  }
}
