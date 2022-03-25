import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/newLaunch/comment/newLaunchCard__commentWrapper.dart';
import 'package:restaurants/widgets/dishCard/newLaunch/newLauchCard__image.dart';

class NewLaunchedCard extends StatefulWidget {
  final Dishes? dish;
  NewLaunchedCard({
    this.dish,
  });
  @override
  _NewLaunchedCardState createState() => _NewLaunchedCardState();
}

class _NewLaunchedCardState extends State<NewLaunchedCard> {
  late CartBloc instanceCartBloc;
  late FavoritesBloc favoriteBlocInstance;

  @override
  initState() {
    super.initState();
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  void goToDetails() {
    Navigator.of(context).push(
      MaterialPageRoute<PlateDetailScreen>(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<DishBloc>(
                create: (context) => DishBloc(),
              ),
              BlocProvider<CartBloc>.value(
                value: instanceCartBloc,
                child: PlateDetailScreen(
                  dish: widget.dish,
                ),
              ),
              BlocProvider<FavoritesBloc>.value(
                value: favoriteBlocInstance,
                child: PlateDetailScreen(
                  dish: widget.dish,
                ),
              ),
            ],
            child: PlateDetailScreen(
              dish: widget.dish,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dish!.comments!.length > 2
          ? 340
          : 200 + (widget.dish!.comments!.length * 55).toDouble(),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => goToDetails(),
        child: Stack(
          children: <Widget>[
            NewLauchCardImage(
              dish: widget.dish!,
            ),
            Positioned(
              top: 200,
              left: MediaQuery.of(context).size.width * 0.07,
              child: Container(
                transform: Matrix4.translationValues(0, -100, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color:
                            Theme.of(context).primaryColorDark.withOpacity(0.5),
                        offset: Offset(0, 0),
                      )
                    ],
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.72,
                  child: NewLauchCardCommentWrapper(
                    dish: widget.dish!,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
