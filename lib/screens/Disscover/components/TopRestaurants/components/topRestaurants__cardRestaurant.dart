import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/screens/RestaurantDetails/restaurantDetails.dart';
import 'package:fith_app__restaurant/widgets/Card__CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantTopSummary extends StatefulWidget {
  final Restaurants resturant;
  RestaurantTopSummary({
    this.resturant,
  });
  @override
  _RestaurantTopSummaryState createState() => _RestaurantTopSummaryState();
}

class _RestaurantTopSummaryState extends State<RestaurantTopSummary> {
  DetailsrestaurantBloc blocDetailResturant;
  CartBloc cartBlocInstance;
  FavoritesBloc favoriteBlocInstance;
  @override
  initState() {
    super.initState();
    blocDetailResturant = BlocProvider.of<DetailsrestaurantBloc>(context);
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  Widget _cardHeader() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            width: 0.6,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.010,
        ),
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
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.resturant.description.substring(0, 20) + "...",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
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
                borderRadius: BorderRadius.circular(50),
              ),
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
          CustomChip(
            text: '${widget.resturant.rating} stars',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
            icon: Icons.star,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 14,
          ),
          CustomChip(
            text: '${widget.resturant.distance}',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 12,
            icon: Icons.location_on,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 14,
          ),
          Material(
            child: InkWell(
              splashColor: Colors.red,
              onTap: () {},
              child: CustomChip(
                text: 'Reserve',
                textColor: Theme.of(context).primaryColorDark,
                textSize: 12,
                icon: Icons.assignment,
                iconColor: Theme.of(context).primaryColorDark,
                iconSize: 14,
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
            widget.resturant.image,
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
                  child: Column(
                    children: <Widget>[
                      _cardHeader(),
                      _cardBody(),
                    ],
                  ),
                )),
          ],
        ),
        onPressed: () {
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
        },
      ),
    );
  }
}
