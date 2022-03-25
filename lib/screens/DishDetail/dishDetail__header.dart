import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Navigation/navigation.dart';

class DishDetailHeader extends StatefulWidget {
  final bool? minSizeReached;
  final Dishes? dish;
  const DishDetailHeader({
    Key? key,
    this.minSizeReached,
    this.dish,
  }) : super(key: key);

  @override
  _DishDetailHeaderState createState() => _DishDetailHeaderState();
}

class _DishDetailHeaderState extends State<DishDetailHeader> {
  late FavoritesBloc favoriteBlocInstance;

  @override
  void initState() {
    super.initState();
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: widget.minSizeReached! ? Colors.white : Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.5,
              color: widget.minSizeReached!
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              offset: Offset(2, 0),
            )
          ],
        ),
        duration: Duration(
          milliseconds: 500,
        ),
        curve: Curves.ease,
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (BuildContext context, FavoritesState state) {
            List<Dishes> favoriteDishes = state.props[1] as List<Dishes>;
            return Navigation(
              secondItem: 'favorite',
              onPressed: favoriteDishes
                      .map((item) => item.name)
                      .contains(widget.dish!.name!)
                  ? () {
                      print("Ya esta en favoritos ahora removerlo");
                    }
                  : () {
                      favoriteBlocInstance.add(
                        FavoriteAddDish(dish: widget.dish),
                      );
                    },
              iconColor: favoriteDishes
                      .map((item) => item.name)
                      .contains(widget.dish!.name!)
                  ? Theme.of(context).buttonColor
                  : widget.minSizeReached!
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
              goBackColor:
                  widget.minSizeReached! ? tertiaryColor : secondaryColor,
              goBack: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
