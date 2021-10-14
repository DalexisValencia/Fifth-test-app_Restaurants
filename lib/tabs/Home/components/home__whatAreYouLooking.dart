import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/tabs/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animations/animations.dart';

class WhatAreYouLookinForFormWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
      width: MediaQuery.of(context).size.width,
      child: WhatAreYouLookinForForm(),
    );
  }
}

class WhatAreYouLookinForForm extends StatefulWidget {
  @override
  _WhatAreYouLookinForFormState createState() =>
      _WhatAreYouLookinForFormState();
}

class _WhatAreYouLookinForFormState extends State<WhatAreYouLookinForForm> {
  // SearchBloc searchBloc;
  late CartBloc cartBlocIntance;
  late FavoritesBloc favoriteBlocIntance;
  @override
  void initState() {
    favoriteBlocIntance = BlocProvider.of<FavoritesBloc>(context);
    cartBlocIntance = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0,
      closedElevation: 2,
      openBuilder: (BuildContext context, closedContainer) {
        Widget screenSearch = ScaffoldSearch(
          from: 'nav',
        );
        return MultiBlocProvider(
          providers: [
            BlocProvider<SearchBloc>(
              create: (BuildContext context) => SearchBloc()
                ..add(
                  SearchInit(
                    findIn: 'all',
                  ),
                ),
              child: screenSearch,
            ),
            BlocProvider<CartBloc>.value(
              value: cartBlocIntance,
              child: screenSearch,
            ),
            BlocProvider<FavoritesBloc>.value(
              value: favoriteBlocIntance,
              child: screenSearch,
            ),
          ],
          child: screenSearch,
        );
      },
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedBuilder: (BuildContext context, closedContainer) {
        return MaterialButton(
          splashColor: Theme.of(context).buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          padding: EdgeInsets.fromLTRB(14, 13, 10, 13),
          color: Theme.of(context).primaryColorLight,
          onPressed: () => closedContainer(),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Theme.of(context).primaryColorDark,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                'What are you looking for?',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 12,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
