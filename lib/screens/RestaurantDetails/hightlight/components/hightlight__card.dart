import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/screens/DishDetail/dishDetail.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      },
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
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.03,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.05,
                          MediaQuery.of(context).size.height * 0.01,
                          MediaQuery.of(context).size.width * 0.05,
                          MediaQuery.of(context).size.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: widget.dish!.promotionLabel!.color,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          widget.dish!.promotionLabel!.label!,
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 12,
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.03,
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Theme.of(context).primaryColorLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomChip(
                      text: "\$${formatterPrice(widget.dish!.price)}",
                      textColor: Theme.of(context).primaryColor,
                      textSize: 12,
                      icon: Icons.monetization_on,
                      iconColor: Theme.of(context).primaryColor,
                      iconSize: 14,
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.dish!.name!,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Builder(
                          builder: (BuildContext context) {
                            List<Widget> starts = [];
                            var obj = [
                              1,
                              2,
                              3,
                              4,
                              5
                            ]; // Calificamos las 5 estrellas
                            for (var prop in obj) {
                              Color _startColor = Theme.of(context).accentColor;
                              if (prop <= widget.dish!.rating!.toInt()) {
                                _startColor = Theme.of(context).buttonColor;
                              }
                              if (prop > widget.dish!.rating!.toInt()) {
                                _startColor = Theme.of(context).accentColor;
                              }
                              starts.add(
                                Icon(
                                  Icons.star,
                                  color: _startColor,
                                  size: 18,
                                ),
                              );
                            }
                            return Row(
                              children: starts,
                            );
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Average ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${widget.dish!.rating}%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 7),
                    CustomChip(
                      text: "Preparation: ${widget.dish!.preparation}",
                      textColor: Theme.of(context).primaryColor,
                      textSize: 12,
                      icon: Icons.access_time,
                      iconColor: Theme.of(context).primaryColor,
                      iconSize: 14,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    widget.dish!.promotionLabel!.active == true
                        ? Builder(builder: (BuildContext context) {
                            List<Widget> _shipPrices = [];
                            widget.dish!.promotionLabel!.pricePromotions!
                                .asMap()
                                .entries
                                .map(
                                  (item) => {
                                    _shipPrices.add(
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          child: Chip(
                                            backgroundColor: item.key == 0
                                                ? Theme.of(context).buttonColor
                                                : Theme.of(context).accentColor,
                                            label: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                '${item.value.amount}-\$${formatterPrice(item.value.price)}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  },
                                )
                                .toList();
                            return Row(
                              children: _shipPrices,
                            );
                          })
                        : SizedBox()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
