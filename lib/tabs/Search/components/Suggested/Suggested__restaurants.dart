import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:fith_app__restaurant/widgets/SeeAll/Screen__seeAllSection.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/Hightlight__resturantsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedRestaurants extends StatelessWidget {
  final restaurantSuggestions;
  SuggestedRestaurants({
    this.restaurantSuggestions,
  });
  Widget _highlightVerticalList() {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (BuildContext context, FavoritesState state) {
        List<Widget> hightlightResturants = [];
        List<Restaurants> stateFavorites = state.props[0];
        restaurantSuggestions.map((item) {
          hightlightResturants.add(
            HightlightResturantsCard(
              hightlight: item,
              selected: false,
              favorite: stateFavorites.contains(item),
            ),
          );
        }).toList();
        return Column(
          children: hightlightResturants,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      child: BlocProvider(
        create: (BuildContext context) => DetailsrestaurantBloc(),
        child: Column(
          children: <Widget>[
            SeeAllSuggested(
              title: 'Highlight Restaurants',
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: withDefaultPadding,
              ),
              child: _highlightVerticalList(),
            )
          ],
        ),
      ),
    );
  }
}
