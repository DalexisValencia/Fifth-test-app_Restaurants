import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:restaurants/screens/Disscover/components/NewLaunch/components/newLauch__comments.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Widget _wrapperImage() {
    return Container(
      height: 240,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            widget.dish!.image!,
          ),
        ),
      ),
    );
  }

  Widget _cardHeader() {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            width: 0.6,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.010,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.dish!.name!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Theme.of(context).primaryColorDark,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.dish!.details!.substring(0, 28) + '...',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.restaurant_menu,
                size: 20,
                color: Theme.of(context).primaryColorLight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            width: 0.6,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomChip(
            text: '4.8 votes',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 11,
            icon: Icons.star,
            iconColor: Theme.of(context).buttonColor,
            iconSize: 13,
          ),
          CustomChip(
            text: '30 minutes',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 11,
            icon: Icons.timer,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 13,
          ),
          InkWell(
            onTap: () {
              print("reservar est plato");
            },
            child: CustomChip(
              text: 'Reserve',
              textColor: Theme.of(context).primaryColorDark,
              textSize: 11,
              icon: Icons.assignment,
              iconColor: Theme.of(context).primaryColorDark,
              iconSize: 13,
            ),
          )
        ],
      ),
    );
  }

  Widget _cardWrapper() {
    return Container(
      transform: Matrix4.translationValues(0, -100, 0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Theme.of(context).primaryColorDark.withOpacity(0.5),
              offset: Offset(0, 0),
            )
          ],
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.72,
        child: Column(
          children: <Widget>[
            _cardHeader(),
            _cardBody(),
            NewLaunchComments(
              comments: widget.dish!.comments!,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dish!.comments!.length > 2
          ? 315
          : 185 + (widget.dish!.comments!.length * 50).toDouble(),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
      ),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {
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
        },
        child: Stack(
          children: <Widget>[
            _wrapperImage(),
            Positioned(
              top: 200,
              left: MediaQuery.of(context).size.width * 0.07,
              child: _cardWrapper(),
            )
          ],
        ),
      ),
    );
  }
}
