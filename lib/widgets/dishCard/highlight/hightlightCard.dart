import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/widgets/dishCard/highlight/hightlightCard__details.dart';

/*
  Utilizado en el slide horizontal de productos destacados.
 */
class SuggestionDishCard extends StatefulWidget {
  final Dishes? suggestion;
  SuggestionDishCard({
    this.suggestion,
  });
  @override
  _SuggestionDishCardState createState() => _SuggestionDishCardState();
}

class _SuggestionDishCardState extends State<SuggestionDishCard> {
  late CartBloc instanceCartBloc;
  late FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  void goToDetails() {
    // Se guarda el screen, para una mejor reutilización
    Widget plateDetailScreenIns = PlateDetailScreen(
      dish: widget.suggestion,
    );
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
                child: plateDetailScreenIns,
              ),
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
              // Imagen de la tarjeta
              fit: BoxFit.cover,
              image: ExactAssetImage(
                widget.suggestion!.image!,
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
            onPressed: () => goToDetails(),
            fillColor: Color(0x000000),
            splashColor: Theme.of(context).buttonColor,
            child: HighlightCardDetails(
              suggestion: widget.suggestion!,
            ),
          ),
        ),
      ),
    );
  }
}
