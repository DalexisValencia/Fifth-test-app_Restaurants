import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/comment/CardComment__comment.dart';
import 'package:restaurants/widgets/dishCard/comment/CardComment__details.dart';
import 'package:restaurants/widgets/dishCard/comment/CardComment__image.dart';

class DishCardComment extends StatefulWidget {
  final Dishes? dish;
  DishCardComment({
    this.dish,
  });
  @override
  _DishCardCommentState createState() => _DishCardCommentState();
}

class _DishCardCommentState extends State<DishCardComment> {
  late CartBloc instanceCartBloc;
  late FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3.5,
              )
            ],
          ),
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(12, 8, 0, 5),
            elevation: 0,
            splashColor: Colors.red,
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<PlateDetailScreen>(
                  builder: (BuildContext context) {
                    Widget plateDetailScreenIns = PlateDetailScreen(
                      dish: widget.dish,
                    );
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<DishBloc>(
                          create: (BuildContext context) => DishBloc(),
                        ),
                        BlocProvider<CartBloc>.value(
                            value: instanceCartBloc,
                            child: plateDetailScreenIns),
                        BlocProvider<FavoritesBloc>.value(
                          value: favoriteBlocInstance,
                          child: plateDetailScreenIns,
                        )
                      ],
                      child: plateDetailScreenIns,
                    );
                  },
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CardCommentImage(
                      image: widget.dish!.image!,
                    ),
                    CardCommentDetails(
                      dish: widget.dish!,
                    ),
                  ],
                ),
                // Muestra solo el primer comentario
                CardCommentItem(
                  dish: widget.dish!,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
