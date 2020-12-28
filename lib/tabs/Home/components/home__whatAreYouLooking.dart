import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/tabs/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatAreYouLookinForFormWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return BlocProvider(
      create: (BuildContext context) => SearchBloc()
        ..add(
          SearchInit(
            findIn: 'all',
          ),
        ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Hero(
          tag: 'mainSearch',
          child: WhatAreYouLookinForForm(),
        ),
      ),
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
  CartBloc cartBlocIntance;
  FavoritesBloc favoriteBlocIntance;
  @override
  void initState() {
    favoriteBlocIntance = BlocProvider.of<FavoritesBloc>(context);
    cartBlocIntance = BlocProvider.of<CartBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      splashColor: Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      padding: EdgeInsets.fromLTRB(14, 13, 10, 13),
      color: Theme.of(context).primaryColorLight,
      onHighlightChanged: (value) {
        if (value == false) {
          final searchBloc = BlocProvider.of<SearchBloc>(context);
          Navigator.of(context).push(
            MaterialPageRoute<ScaffoldSearch>(
              builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<SearchBloc>.value(
                      // create: (BuildContext context) => searchBloc,
                      value: searchBloc,
                      child: ScaffoldSearch(),
                    ),
                    BlocProvider<CartBloc>.value(
                      value: cartBlocIntance,
                      child: ScaffoldSearch(),
                      // create: (BuildContext context) => cartBlocIntance,
                    ),
                    BlocProvider<FavoritesBloc>.value(
                      value: favoriteBlocIntance,
                      child: ScaffoldSearch(),
                    ),
                  ],
                  child: ScaffoldSearch(),
                );
              },
            ),
          );
        }
      },
      onPressed: () {},
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
  }
}
