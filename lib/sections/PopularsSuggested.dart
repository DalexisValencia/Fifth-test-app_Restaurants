import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
// import 'package:fith_app__restaurant/interfaces/populars.dart';
import 'package:fith_app__restaurant/sections/CardProductWithComments.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularSuggestedWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: withDefaultPadding),
            child: FullSectionTitle(
              title: 'Popular',
              rightContainer:
                  RoundedCustomButton(title: 'See all', callPressed: () {}),
              paddingRight: false,
            )),
        PopularSuggestions(),
      ],
    );
  }
}

class PopularSuggestions extends StatefulWidget {
  @override
  _PopularSuggestionsState createState() => _PopularSuggestionsState();
}

class _PopularSuggestionsState extends State<PopularSuggestions> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Builder(builder: (BuildContext context) {
        return new Column(
            children: dishes
                .map((item) => new CardProductWithComments(dish: item))
                .toList());
      }),
    );
  }
}
