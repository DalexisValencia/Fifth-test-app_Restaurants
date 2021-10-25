import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/normal/dishCard__image.dart';
import 'package:restaurants/widgets/dishCard/normal/dishCard__details.dart';
// Bloc pattern:

class DishCard extends StatefulWidget {
  final Dishes? dish;
  final bool borderCustomColor;
  DishCard({
    this.dish,
    this.borderCustomColor = false,
  });
  @override
  _DishCardState createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  late CartBloc cartBlocIntance;
  late FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    cartBlocIntance = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
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
              BlocProvider.value(
                value: cartBlocIntance,
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
  }

  void addToCar(Dishes? item) {
    cartBlocIntance.add(
      AddToCart(
        dish: widget.dish,
      ),
    );
    snackBarAddCart(
      context,
      widget.dish!.name!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: animationOpacityTime,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderCustomColor
              ? Theme.of(context).buttonColor
              : Theme.of(context).accentColor.withOpacity(0.2),
          width: widget.borderCustomColor ? 1.2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 5),
      child: MaterialButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        color: widget.borderCustomColor
            ? cardSelectedBgColor
            : Theme.of(context).primaryColorLight,
        padding: EdgeInsets.all(0),
        splashColor: Theme.of(context).buttonColor,
        highlightColor: Theme.of(context).buttonColor.withOpacity(0.1),
        onPressed: () => goToDetails(),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DishCardImage(
                dish: widget.dish!,
              ),
              DishCardDetails(
                dish: widget.dish!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
