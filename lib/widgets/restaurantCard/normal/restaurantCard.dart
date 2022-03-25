import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails.dart';
// import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/restaurantCard/normal/restaurantCard__seemore.dart';
import 'package:restaurants/widgets/restaurantCard/normal/restaurantCard__favorite.dart';
import 'package:restaurants/widgets/restaurantCard/normal/restaurantCard__headline.dart';

class HightlightResturantsCard extends StatefulWidget {
  final Restaurants? hightlight;
  final bool? selected;
  final bool? favorite;
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
  late DetailsrestaurantBloc detailsRestaurant;
  late CartBloc cartBlocInstance;
  late FavoritesBloc favoriteBlocIntance;
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
              ),
              BlocProvider.value(
                value: favoriteBlocIntance,
                child: RestaurantDetailWrapper(),
              )
            ],
            child: RestaurantDetailWrapper(),
          );
        },
      ),
    );
  }

  void addToFavorites() {
    favoriteBlocIntance.add(
      FavoriteAddRestaurant(
        restaurant: widget.hightlight!,
      ),
    );
    snackBarAddCart(context, widget.hightlight!.name!);
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
            widget.hightlight!.image!,
          ),
        ),
        border: Border.all(
          color: widget.selected!
              ? Theme.of(context).buttonColor
              : Colors.transparent,
          width: borderWidthSelected + 1,
        ),
      ),
      width: totalWidth,
      height: MediaQuery.of(context).size.height * 0.30,
      child: MaterialButton(
        // this was a RaisedButton
        padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () => goRestaurantDetails(),
        color: widget.selected!
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
                RestaurantCardHeadline(
                  selected: widget.selected!,
                  favorite: widget.favorite!,
                  restaurant: widget.hightlight!,
                ),
                RestaurantCardFavorite(
                  selected: widget.selected!,
                  favorite: widget.favorite!,
                  addToFavorites: addToFavorites,
                )
              ],
            ),
            RestaurantCardSeeMore(
              goRestaurantDetails: goRestaurantDetails,
              selected: widget.selected,
            ),
          ],
        ),
      ),
    );
  }
}
