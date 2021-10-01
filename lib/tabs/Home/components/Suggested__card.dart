import 'dart:async';

import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:fith_app__restaurant/screens/Disscover/disscover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedCard extends StatefulWidget {
  final Category? category;
  SuggestedCard({
    this.category,
  });

  @override
  _SuggestedCardState createState() => _SuggestedCardState();
}

class _SuggestedCardState extends State<SuggestedCard> {
  DiscoveryBloc? blocDiscovery;
  CartBloc? blocCartInstance;
  FavoritesBloc? favoriteBlocInstance;
  @override
  void initState() {
    blocDiscovery = BlocProvider.of<DiscoveryBloc>(context);
    blocCartInstance = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // this was a RaisedButton
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      onPressed: () {
        Timer(
          Duration(milliseconds: 200),
          () {
            blocDiscovery!.add(
              DiscoveryStart(
                category: widget.category!.name!,
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute<DiscoverScaffold>(
                builder: (BuildContext context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: blocDiscovery!,
                        child: DiscoverScaffold(),
                      ),
                      BlocProvider.value(
                        value: blocCartInstance!,
                        child: DiscoverScaffold(),
                      ),
                      BlocProvider.value(
                        value: favoriteBlocInstance!,
                        child: DiscoverScaffold(),
                      )
                    ],
                    child: DiscoverScaffold(),
                  );
                },
              ),
            );
          },
        );
      },
      color: Theme.of(context).primaryColorLight,
      splashColor: Theme.of(context).buttonColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  widget.category!.iconSource!,
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.category!.name!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
