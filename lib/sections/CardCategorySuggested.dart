import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
// import 'package:fith_app__restaurant/interfaces/CategorySuggested.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/plate.detail.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fith_app__restaurant/screens/seemoreDishesInRestaurant.dart';

class CardCategorySuggested extends StatefulWidget {
  final List<Dishes> suggestions;
  CardCategorySuggested({this.suggestions});
  @override
  CardCategorySuggestedState createState() => CardCategorySuggestedState();
}

class CardCategorySuggestedState extends State<CardCategorySuggested> {
  DetailsrestaurantBloc instancerestaurantBloc;
  @override
  void initState() {
    super.initState();
    instancerestaurantBloc = BlocProvider.of<DetailsrestaurantBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(top: totalWidth * 0.05),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: withDefaultPadding),
            child: FullSectionTitle(
              title: 'Suggestions',
              rightContainer: RoundedCustomButton(
                  title: 'See all',
                  callPressed: () {
                    customAnimateNavigation(
                        context,
                        BlocProvider.value(
                          value: instancerestaurantBloc,
                          child: SeeMoreDishesByRestaurant(
                            searchKey: 'suggestions',
                          ),
                        ));
                  }),
            ),
          ),
          WrapperSuggestions(suggestions: widget.suggestions)
        ],
      ),
    );
  }
}

class WrapperSuggestions extends StatefulWidget {
  final List<Dishes> suggestions;
  WrapperSuggestions({this.suggestions});
  @override
  _WrapperSuggestionsState createState() => _WrapperSuggestionsState();
}

class _WrapperSuggestionsState extends State<WrapperSuggestions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return BlocProvider(
      create: (BuildContext context) => DishBloc(),
      child: Container(
        margin: EdgeInsets.only(left: withDefaultPadding),
        width: totalWidth,
        height: totalHeight * 0.25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.suggestions.length,
          itemBuilder: (BuildContext context, int index) {
            return SuggestionCard(
              suggestion: widget.suggestions[index],
            );
          },
        ),
      ),
    );
  }
}

class SuggestionCard extends StatefulWidget {
  final Dishes suggestion;
  SuggestionCard({this.suggestion});
  @override
  _SuggestionCardState createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  DishBloc instanceDishBloc;
  CartBloc instanceCartBloc;
  @override
  void initState() {
    super.initState();
    instanceDishBloc = BlocProvider.of<DishBloc>(context);
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Card(
        margin: EdgeInsets.only(right: totalWidth * 0.04),
        child: InkWell(
          splashColor: Colors.red,
          child: Container(
              width: totalWidth * 0.41,
              height: totalHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage(
                    widget.suggestion.image,
                  ),
                ),
              ),
              child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.only(
                      bottom: totalHeight * 0.03,
                      left: (totalWidth * 0.03) + 5,
                      right: totalWidth * 0.03),
                  elevation: 0,
                  onPressed: () {
                    print(widget.suggestion.name + 'EL NOMBRE');
                    instanceDishBloc
                        .add(DishStart(currentDish: widget.suggestion));
                    Navigator.of(context).push(
                      MaterialPageRoute<PlateDetailWrapper>(builder: (context) {
                        // return BlocProvider.value(
                        //   value: instanceDishBloc,
                        //   child: PlateDetailWrapper(),
                        // );
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider<DishBloc>.value(
                              value: instanceDishBloc,
                              child: PlateDetailWrapper(),
                              // create: (BuildContext context) =>
                              //     instanceDishBloc,
                            ),
                            BlocProvider<CartBloc>.value(
                              value: instanceCartBloc,
                              child: PlateDetailWrapper(),
                              // create: (BuildContext context) =>
                              //     instanceCartBloc,
                            )
                          ],
                          child: PlateDetailWrapper(),
                        );
                      }),
                    );
                  },
                  fillColor: Color(0x000000),
                  splashColor: Theme.of(context).buttonColor,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.suggestion.name,
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                Shadow(
                                    blurRadius: 3.0,
                                    color: Colors.black,
                                    offset: Offset(0, 0))
                              ]),
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.suggestion.details.substring(0, 15) +
                                  '...',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                      shadows: [
                                    Shadow(
                                        blurRadius: 3.0,
                                        color: Colors.black,
                                        offset: Offset(0, 0))
                                  ]),
                            ))
                      ],
                    ),
                  ))),
        ));
  }
}
