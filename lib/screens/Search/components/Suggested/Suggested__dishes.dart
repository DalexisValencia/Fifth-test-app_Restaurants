import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';

class SuggestedDishes extends StatefulWidget {
  final List<Dishes> suggestions;
  SuggestedDishes({this.suggestions});
  @override
  _SuggestedDishesState createState() => _SuggestedDishesState();
}

class _SuggestedDishesState extends State<SuggestedDishes> {
  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding),
      child: FullSectionTitle(
        title: 'Suggestions',
        rightContainer: RoundedCustomButton(
            title: 'See all',
            callPressed: () {
              print('SEE ALL SUGESTIONS');
              // customAnimateNavigation(
              //     context,
              //     BlocProvider.value(
              //       value: instancerestaurantBloc,
              //       child: SeeMoreDishesByRestaurant(
              //           searchKey: 'suggestions'),
              //     ));
            }),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: WrapperSuggestions(
        suggestions: widget.suggestions,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          _header(),
          _body(),
        ],
      ),
    );
  }
}
