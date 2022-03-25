import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:restaurants/widgets/dishCard/nearyou/nearYouCard__description.dart';
import 'package:restaurants/widgets/dishCard/nearyou/nearYouCard__rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearYouCard extends StatefulWidget {
  final Dishes? dish;
  final int? index;
  NearYouCard({
    this.dish,
    this.index,
  });
  @override
  _NearYouCardState createState() => _NearYouCardState();
}

class _NearYouCardState extends State<NearYouCard> {
  late CartBloc cartBlocInstance;
  late FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: widget.index! < 9 ? MediaQuery.of(context).size.width * 0.04 : 5,
      ),
      width: MediaQuery.of(context).size.width / 2.6,
      child: MaterialButton(
        //this was a raisedButton Check updates
        elevation: 0,
        onPressed: () => goToDetails(),
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
                    widget.dish!.image!,
                  ),
                ),
              ),
              child: NearYouCardRate(
                dish: widget.dish!,
              ),
            ),
            NearYouCardDescription(
              dish: widget.dish!,
            )
          ],
        ),
      ),
    );
  }
}
