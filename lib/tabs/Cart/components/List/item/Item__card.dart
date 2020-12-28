import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/DishDetail/dishDetail.dart';
import 'package:fith_app__restaurant/widgets/Card__CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCartCard extends StatefulWidget {
  final Dishes dish;
  final bool selected;
  final Function priceByCard;
  ItemCartCard({Key key, this.dish, this.selected, this.priceByCard})
      : super(key: key);
  @override
  _ItemCartCardState createState() => _ItemCartCardState();
}

class _ItemCartCardState extends State<ItemCartCard> {
  CartBloc cartBlocInstance;
  FavoritesBloc instanceFavorite;
  @override
  initState() {
    super.initState();
    cartBlocInstance = BlocProvider.of<CartBloc>(context);
    instanceFavorite = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
      },
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
          borderRadius: widget.dish.additions.length == 0
              ? BorderRadius.circular(borderRadiusCards)
              : BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusCards),
                  topRight: Radius.circular(borderRadiusCards),
                ),
          color: !widget.selected
              ? Theme.of(context).primaryColorLight
              : cardSelectedBgColor,
          border: Border.all(
            color: widget.selected
                ? Theme.of(context).buttonColor
                : Theme.of(context).primaryColorDark.withOpacity(0.5),
            width: widget.selected ? borderWidthSelected : borderWidhNoSelected,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusImages),
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
                height: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.fromLTRB(5, 6, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        CustomChip(
                          text: widget.dish.preparation,
                          textColor: Theme.of(context).primaryColor,
                          textSize: 12.5,
                          icon: Icons.timer,
                          iconColor: Theme.of(context).primaryColor,
                          iconSize: 13,
                        ),
                        CustomChip(
                          text: formatterPrice(widget.dish.price),
                          textColor: Theme.of(context).buttonColor,
                          textSize: 12.5,
                          icon: Icons.monetization_on,
                          iconColor: Theme.of(context).buttonColor,
                          iconSize: 13,
                        ),
                      ],
                    ),
                    Text(
                      widget.dish.name,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                    ),
                    Text(
                      widget.dish.details.length > 55
                          ? widget.dish.details.substring(0, 58) + " ... "
                          : widget.dish.details,
                      style: Theme.of(context).textTheme.overline.copyWith(
                            letterSpacing: 0,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "\$${formatterPrice(widget.dish.finalPrice)}",
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).buttonColor,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: widget.dish.promotionLabel.discounts > 0,
                          child: Text(
                            "- \$${formatterPrice(widget.dish.promotionLabel.discounts)}",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(0),
              width: 35,
              height: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        cartBlocInstance.add(
                          UpdateAmount(
                            dish: widget.dish,
                            action: 'add',
                          ),
                        );
                      },
                      child: Container(
                        color: Theme.of(context).buttonColor,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        width: 35,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Center(
                      child: Text(
                        widget.dish.amount.toString(),
                        style: Theme.of(context).textTheme.button.copyWith(
                              fontSize: 12,
                              color: Theme.of(context).primaryColorDark,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: widget.dish.amount == 1
                          ? null
                          : () {
                              cartBlocInstance.add(
                                UpdateAmount(
                                  dish: widget.dish,
                                  action: 'remove',
                                ),
                              );
                            },
                      child: Container(
                        color: widget.dish.amount == 1
                            ? Theme.of(context).primaryColor.withOpacity(0.4)
                            : Theme.of(context).buttonColor,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontSize: 17,
                              color: widget.dish.amount == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        height: 25,
                        width: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
