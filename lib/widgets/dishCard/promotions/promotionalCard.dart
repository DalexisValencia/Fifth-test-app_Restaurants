import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/promotions/promotionalCard__features.dart';
import 'package:restaurants/widgets/dishCard/promotions/promotionalCard__labelOffer.dart';

class HighlightRestaurantCard extends StatefulWidget {
  final Dishes? dish;
  HighlightRestaurantCard({
    this.dish,
  });
  @override
  _HighlightRestaurantCardState createState() =>
      _HighlightRestaurantCardState();
}

class _HighlightRestaurantCardState extends State<HighlightRestaurantCard> {
  late CartBloc instanceCartBloc;
  late FavoritesBloc instanceFavorite;
  @override
  void initState() {
    super.initState();
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
    instanceFavorite = BlocProvider.of<FavoritesBloc>(context);
  }

  void goToDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<DishBloc>(
                create: (context) => DishBloc(),
              ),
              BlocProvider.value(
                value: instanceCartBloc,
                child: PlateDetailScreen(
                  dish: widget.dish,
                ),
              ),
              BlocProvider.value(
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToDetails(),
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.025,
          bottom: MediaQuery.of(context).size.height * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 0),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.70,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.yellow,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                      widget.dish!.image!,
                    ),
                  ),
                ),
                child: PromotionCardOffer(
                  dish: widget.dish!,
                ),
              ),
            ),
            PromotionCardFeatures(
              dish: widget.dish!,
            ),
          ],
        ),
      ),
    );
  }
}
