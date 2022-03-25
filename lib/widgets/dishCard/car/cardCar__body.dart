import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/car/cardCar__addAmount.dart';
import 'package:restaurants/widgets/dishCard/car/cardCar__features.dart';
import 'package:restaurants/widgets/dishCard/car/cardCar__image.dart';

class CardCarBody extends StatefulWidget {
  final Dishes? dish;
  final bool? selected;
  final Function? priceByCard;
  CardCarBody({
    Key? key,
    this.dish,
    this.selected,
    this.priceByCard,
  }) : super(key: key);
  @override
  _CardCarBodyState createState() => _CardCarBodyState();
}

class _CardCarBodyState extends State<CardCarBody> {
  late CartBloc cartBlocInstance;
  late FavoritesBloc instanceFavorite;
  @override
  initState() {
    super.initState();
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
    instanceFavorite = BlocProvider.of<FavoritesBloc>(context);
  }

  void goToDetails() {
    Navigator.of(context).push(
      MaterialPageRoute<PlateDetailScreen>(
        builder: (BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<DishBloc>(
                create: (BuildContext context) => DishBloc(),
              ),
              BlocProvider<CartBloc>.value(
                value: cartBlocInstance,
                child: PlateDetailScreen(
                  dish: widget.dish,
                ),
              ),
              BlocProvider<FavoritesBloc>.value(
                value: instanceFavorite,
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

  void addAmount() {
    cartBlocInstance.add(
      UpdateAmount(
        dish: widget.dish!,
        action: 'add',
      ),
    );
  }

  void substracAmount() {
    cartBlocInstance.add(
      UpdateAmount(
        dish: widget.dish!,
        action: 'remove',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToDetails(),
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 250,
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * defaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: widget.dish!.additions!.length == 0
              ? BorderRadius.circular(borderRadiusCards)
              : BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusCards),
                  topRight: Radius.circular(borderRadiusCards),
                ),
          color: !widget.selected!
              ? Theme.of(context).primaryColorLight
              : cardSelectedBgColor,
          border: Border.all(
            color: widget.selected!
                ? Theme.of(context).buttonColor
                : Theme.of(context).primaryColorDark.withOpacity(0.5),
            width:
                widget.selected! ? borderWidthSelected : borderWidhNoSelected,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardCarImage(
              image: widget.dish!.image!,
            ),
            CardCarFeatures(
              dish: widget.dish!,
            ),
            CardCarAddAmount(
              add: addAmount,
              substract: substracAmount,
              amount: widget.dish!.amount,
            )
          ],
        ),
      ),
    );
  }
}
