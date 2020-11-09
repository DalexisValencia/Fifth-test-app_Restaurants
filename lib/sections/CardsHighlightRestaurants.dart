import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
// import 'package:fith_app__restaurant/interfaces/HightlightResturantsInterface.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/restaurant.details.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HightlightResturantsWrapper extends StatelessWidget {
  final restaurantSuggestions;
  HightlightResturantsWrapper({this.restaurantSuggestions});
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      child: BlocProvider(
        create: (BuildContext context) => DetailsrestaurantBloc(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: withDefaultPadding),
              child: FullSectionTitle(
                title: 'Highlight Restaurants',
                rightContainer:
                    RoundedCustomButton(title: 'See all', callPressed: () {}),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: withDefaultPadding),
              child:
                  HightLightRestaurantsList(suggestions: restaurantSuggestions),
            )
          ],
        ),
      ),
    );
  }
}

class HightLightRestaurantsList extends StatefulWidget {
  final List<Restaurants> suggestions;
  HightLightRestaurantsList({this.suggestions});
  @override
  _HightLightRestaurantsListState createState() =>
      _HightLightRestaurantsListState();
}

class _HightLightRestaurantsListState extends State<HightLightRestaurantsList> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: widget.suggestions
              .map((item) => new HightlightResturants(hightlight: item))
              .toList(),
        );
      },
    );
  }
}

class HightlightResturants extends StatefulWidget {
  final Restaurants hightlight;
  HightlightResturants({this.hightlight});
  @override
  _HightlightResturantsState createState() => _HightlightResturantsState();
}

class _HightlightResturantsState extends State<HightlightResturants> {
  DetailsrestaurantBloc detailsRestaurant;
  @override
  void initState() {
    super.initState();
    detailsRestaurant = BlocProvider.of<DetailsrestaurantBloc>(context);
  }

  Widget seeMoreHeader() {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      width: totalWidth,
      child: Align(
        alignment: Alignment.bottomRight,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          color: Theme.of(context).buttonColor,
          elevation: 0,
          child: Text(
            'See more',
            style: Theme.of(context).textTheme.caption.copyWith(
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.w500),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: totalHeight * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage(widget.hightlight.image))),
      width: totalWidth,
      height: MediaQuery.of(context).size.height * 0.30,
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          detailsRestaurant
              .add(DetailsresturantSetCurrent(restaurant: widget.hightlight));

          customAnimateNavigation(
              context,
              BlocProvider.value(
                value: detailsRestaurant,
                child: RestaurantDetailWrapper(),
              ));
        },
        color: Colors.transparent,
        splashColor: Theme.of(context).buttonColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: totalWidth * 0.12,
                  child: CircleIconButton(
                      icon: Icons.store_mall_directory,
                      color: Theme.of(context).primaryColorLight,
                      bgColor: Theme.of(context).primaryColor..withOpacity(0.5),
                      trigger: () {}),
                ),
                Container(
                  width: totalWidth * 0.50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.hightlight.name,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              shadows: [
                                Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 2.0,
                                  color: Theme.of(context).primaryColorDark,
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: totalHeight * 0.007,
                      ),
                      Text(
                        widget.hightlight.description,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 2.0,
                                color: Theme.of(context).primaryColorDark,
                              )
                            ]),
                      )
                    ],
                  ),
                ),
                Container(
                  width: totalWidth * 0.12,
                  child: CircleIconButton(
                      icon: Icons.favorite,
                      color: Theme.of(context).primaryColorLight,
                      bgColor: Colors.red,
                      // bgColor: widget.hightlight.favorite
                      //     ? Theme.of(context).buttonColor
                      //     : Colors.white.withOpacity(0.3),
                      trigger: () {}),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
