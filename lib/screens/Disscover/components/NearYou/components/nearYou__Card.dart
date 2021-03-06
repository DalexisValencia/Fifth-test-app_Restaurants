import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearYouCard extends StatefulWidget {
  final Dishes dish;
  final int index;
  NearYouCard({
    this.dish,
    this.index,
  });
  @override
  _NearYouCardState createState() => _NearYouCardState();
}

class _NearYouCardState extends State<NearYouCard> {
  CartBloc cartBlocInstance;
  FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: widget.index < 9 ? MediaQuery.of(context).size.width * 0.04 : 5,
      ),
      width: MediaQuery.of(context).size.width / 2.6,
      child: RaisedButton(
        elevation: 0,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<PlateDetailScreen>(
              builder: (context) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<DishBloc>(
                      create: (context) => DishBloc(),
                    ),
                    BlocProvider.value(
                      value: cartBlocInstance,
                      child: PlateDetailScreen(
                        dish: widget.dish,
                      ),
                    ),
                    BlocProvider.value(
                      value: favoriteBlocInstance,
                      child: PlateDetailScreen(
                        dish: widget.dish,
                      ),
                    )
                  ],
                  child: PlateDetailScreen(
                    dish: widget.dish,
                  ),
                );
              },
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(0),
        color: Theme.of(context).primaryColorLight,
        splashColor: Colors.red,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2.6,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage(
                    widget.dish.image,
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 3,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColorLight,
                            size: 11,
                          ),
                          Text(
                            widget.dish.rating.toString(),
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.6,
              padding: EdgeInsets.only(top: 6, left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.dish.name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.dish.details.substring(1, 25) + '...',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            wordSpacing: 0.5,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
