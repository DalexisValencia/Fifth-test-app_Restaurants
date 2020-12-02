import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/tabs/Search/components/Suggested/components/Suggested__seeAll.dart';
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
    return Builder(builder: (BuildContext context) {
      List<Widget> hightlightResturants = [];
      restaurantSuggestions.map((item) {
        hightlightResturants.add(
          HightlightResturantsCard(
            hightlight: item,
          ),
        );
      }).toList();
      return Column(
        children: hightlightResturants,
      );
    });
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
            Padding(
              padding: EdgeInsets.only(left: withDefaultPadding),
              child: SeeAllSuggested(
                title: 'Highlight Restaurants',
              ),
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
