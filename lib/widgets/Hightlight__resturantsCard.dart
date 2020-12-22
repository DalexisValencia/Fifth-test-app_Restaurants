import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/RestaurantDetails/restaurantDetails.dart';
import 'package:fith_app__restaurant/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HightlightResturantsCard extends StatefulWidget {
  final Restaurants hightlight;
  final bool selected;
  final bool favorite;
  HightlightResturantsCard({
    this.hightlight,
    this.selected,
    this.favorite,
  });
  @override
  _HightlightResturantsCardState createState() =>
      _HightlightResturantsCardState();
}

class _HightlightResturantsCardState extends State<HightlightResturantsCard> {
  DetailsrestaurantBloc detailsRestaurant;
  CartBloc cartBlocInstance;
  FavoritesBloc favoriteBlocIntance;
  @override
  void initState() {
    super.initState();
    detailsRestaurant = BlocProvider.of<DetailsrestaurantBloc>(context);
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
    favoriteBlocIntance = BlocProvider.of<FavoritesBloc>(context);
  }

  void goRestaurantDetails() {
    detailsRestaurant.add(
      DetailsresturantSetCurrent(
        restaurant: widget.hightlight,
      ),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: detailsRestaurant,
                child: RestaurantDetailWrapper(),
              ),
              BlocProvider.value(
                value: cartBlocInstance,
                child: RestaurantDetailWrapper(),
                // create: (context) => SubjectBloc(),
              ),
            ],
            child: RestaurantDetailWrapper(),
          );
        },
      ),
    );
  }

  Widget seeMoreHeader() {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      width: totalWidth,
      child: Align(
        alignment: Alignment.bottomRight,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () => goRestaurantDetails(),
          color: widget.selected
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).buttonColor,
          elevation: 0,
          child: Text(
            'See more',
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: widget.selected
                      ? Theme.of(context).buttonColor
                      : Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.w500,
                ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            widget.hightlight.image,
          ),
        ),
        border: Border.all(
          color: widget.selected
              ? Theme.of(context).buttonColor
              : Colors.transparent,
          width: borderWidthSelected + 1,
        ),
      ),
      width: totalWidth,
      height: MediaQuery.of(context).size.height * 0.30,
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () => goRestaurantDetails(),
        color: widget.selected
            ? Theme.of(context).buttonColor.withOpacity(0.4)
            : Colors.transparent,
        splashColor: Theme.of(context).buttonColor,
        hoverColor: Colors.red,
        highlightColor: Theme.of(context).buttonColor.withOpacity(0.2),
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
                    color: widget.selected && !widget.favorite
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColorLight.withOpacity(0.9),
                    bgColor: widget.selected && !widget.favorite
                        ? Theme.of(context).buttonColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                    trigger: () {},
                  ),
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
                            ],
                          ),
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
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: totalWidth * 0.12,
                  child: CircleIconButton(
                    icon: Icons.favorite,
                    color: widget.selected && !widget.favorite
                        ? Theme.of(context).buttonColor
                        : widget.favorite
                            ? Theme.of(context).buttonColor
                            : Theme.of(context).primaryColorLight,
                    bgColor: widget.selected && !widget.favorite
                        ? Theme.of(context).primaryColorLight
                        : widget.favorite
                            ? Theme.of(context).primaryColorLight
                            : Theme.of(context).buttonColor,
                    trigger: widget.selected
                        ? null
                        : () {
                            favoriteBlocIntance.add(
                              FavoriteAddRestaurant(
                                restaurant: widget.hightlight,
                              ),
                            );
                            snackBarAddCart(context, widget.hightlight.name);
                          },
                  ),
                )
              ],
            ),
            seeMoreHeader()
          ],
        ),
      ),
    );
  }
}
