import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/DishDetail/dishDetail.dart';
import 'package:fith_app__restaurant/widgets/Card__CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Bloc pattern:

class DishCard extends StatefulWidget {
  final Dishes dish;
  final bool borderCustomColor;
  DishCard({
    this.dish,
    this.borderCustomColor = false,
  });
  @override
  _DishCardState createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  CartBloc cartBlocIntance;
  @override
  void initState() {
    super.initState();
    cartBlocIntance = BlocProvider.of<CartBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
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
        onPressed: () {
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
                      //create: (context) => SubjectBloc(),
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
          margin: EdgeInsets.symmetric(
            vertical: 5,
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                      widget.dish.image,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Text(
                          widget.dish.name,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark,
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.015,
                          ),
                          child: Text(
                            widget.dish.details.substring(0, 80) + '...',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.03,
                          ),
                          child: Row(
                            children: <Widget>[
                              CustomChip(
                                text: '${widget.dish.rating} Votes',
                                textColor: Theme.of(context).primaryColorDark,
                                textSize: 12,
                                icon: Icons.star,
                                iconColor: Theme.of(context).buttonColor,
                                iconSize: 16,
                              ),
                              Spacer(),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    cartBlocIntance.add(
                                      AddToCart(
                                        dish: widget.dish,
                                      ),
                                    );
                                    snackBarAddCart(
                                      context,
                                      widget.dish.name,
                                    );
                                  },
                                  splashColor: Theme.of(context).buttonColor,
                                  child: CustomChip(
                                    text: '\$${widget.dish.price.toInt()}', //\$
                                    textColor:
                                        Theme.of(context).primaryColorDark,
                                    textSize: 12,
                                    icon: Icons.add_shopping_cart,
                                    iconColor: Theme.of(context).buttonColor,
                                    iconSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
