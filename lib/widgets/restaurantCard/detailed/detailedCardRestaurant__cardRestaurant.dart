import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Restaurants.dart';
import 'package:restaurants/screens/RestaurantDetails/restaurantDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/restaurantCard/detailed/detailedCardRestaurant__overlayDetail.dart';

/*
Utilizado en la sección disscover, en tops Restaurant
 */
class RestaurantTopSummary extends StatefulWidget {
  final Restaurants? resturant;
  RestaurantTopSummary({
    this.resturant,
  });
  @override
  _RestaurantTopSummaryState createState() => _RestaurantTopSummaryState();
}

class _RestaurantTopSummaryState extends State<RestaurantTopSummary> {
  late DetailsrestaurantBloc blocDetailResturant;
  late CartBloc cartBlocInstance;
  late FavoritesBloc favoriteBlocInstance;
  @override
  initState() {
    super.initState();
    blocDetailResturant = BlocProvider.of<DetailsrestaurantBloc>(context);
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  void goToDetailsRestaurants() {
    blocDetailResturant.add(
      DetailsresturantSetCurrent(
        restaurant: widget.resturant,
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: blocDetailResturant,
                child: RestaurantDetailWrapper(),
              ),
              BlocProvider.value(
                value: cartBlocInstance,
                child: RestaurantDetailWrapper(),
              ),
              BlocProvider.value(
                value: favoriteBlocInstance,
                child: RestaurantDetailWrapper(),
              ),
            ],
            child: RestaurantDetailWrapper(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(
        right: withDefaultPadding,
        bottom: 10,
        left: MediaQuery.of(context).size.width * defaultPadding,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            widget.resturant!.image!,
          ),
        ),
      ),
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
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: withDefaultPadding,
                ),
                child: DetailedCardRestaurantOverlayDetail(
                  resturant: widget.resturant!,
                ),
              ),
            ),
          ],
        ),
        onPressed: () => goToDetailsRestaurants(),
      ),
    );
  }
}
