import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionDishCard extends StatefulWidget {
  final Dishes suggestion;
  SuggestionDishCard({
    this.suggestion,
  });
  @override
  _SuggestionDishCardState createState() => _SuggestionDishCardState();
}

class _SuggestionDishCardState extends State<SuggestionDishCard> {
  CartBloc instanceCartBloc;
  FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
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
              right: totalWidth * 0.03,
            ),
            elevation: 0,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<PlateDetailScreen>(
                  builder: (context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<DishBloc>(
                          create: (BuildContext context) => DishBloc(),
                        ),
                        BlocProvider<CartBloc>.value(
                          value: instanceCartBloc,
                          child: PlateDetailScreen(
                            dish: widget.suggestion,
                          ),
                        ),
                        BlocProvider<FavoritesBloc>.value(
                          value: favoriteBlocInstance,
                          child: PlateDetailScreen(
                            dish: widget.suggestion,
                          ),
                        )
                      ],
                      child: PlateDetailScreen(
                        dish: widget.suggestion,
                      ),
                    );
                  },
                ),
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
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.suggestion.details.substring(0, 15) + '...',
                      style: Theme.of(context).textTheme.caption.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black,
                            offset: Offset(0, 0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
