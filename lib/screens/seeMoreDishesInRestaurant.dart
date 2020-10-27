import 'package:fith_app__restaurant/blocs/bloc/restaurant/bloc/detailsrestaurant_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMoreDishesByRestaurant extends StatefulWidget {
  final String searchKey;
  SeeMoreDishesByRestaurant({this.searchKey});
  @override
  _SeeMoreDishesByRestaurantState createState() =>
      _SeeMoreDishesByRestaurantState();
}

class _SeeMoreDishesByRestaurantState extends State<SeeMoreDishesByRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<DetailsrestaurantBloc, DetailsrestaurantState>(
            builder: (BuildContext context, DetailsrestaurantState state) {
              Restaurants restaurantState = state.props[0];
              List<Dishes> completeList;
              switch (widget.searchKey) {
                case 'lunchNow':
                  completeList = restaurantState.lunchNow;
                  break;
                case 'suggestions':
                  completeList = restaurantState.suggestions;
                  break;
                default:
                  completeList = [];
              }
              print(completeList);
              return Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 300,
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      // List<Widget> dishes = [];
                      // completeList.map((e) {
                      //   print(e.name);
                      //   dishes.add(Text(e.name));
                      // }).toList();
                      return new Column(
                          children: completeList
                              .map((item) => new Text('Popular'))
                              .toList());
                    },
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 300,
                  ),
                  Container(
                    color: Colors.green,
                    height: 300,
                  ),
                  Container(
                    color: Colors.orange,
                    height: 300,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
