import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/plate.detail.dart';
import 'package:fith_app__restaurant/widgets/iconAndText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Bloc pattern:

class QuickView extends StatefulWidget {
  final Dishes dish;
  QuickView({this.dish});
  @override
  _QuickViewState createState() => _QuickViewState();
}

class _QuickViewState extends State<QuickView> {
  DishBloc instanceBlocDish;
  @override
  void initState() {
    super.initState();
    instanceBlocDish = BlocProvider.of<DishBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).accentColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: 5),
      child: MaterialButton(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(0),
          splashColor: Colors.red,
          onPressed: () {
            instanceBlocDish.add(DishStart(currentDish: widget.dish));

            Navigator.of(context)
                .push(MaterialPageRoute<PlateDetailWrapper>(builder: (context) {
              return BlocProvider.value(
                value: instanceBlocDish,
                child: PlateDetailWrapper(),
              );
            }));
            print('iremos al detalle del producto');
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
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
                          image: ExactAssetImage(widget.dish.image))),
                ),
                Expanded(
                  child: Container(
                    height: 90,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text(
                            widget.dish.name,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.width *
                                      0.015),
                              child: Text(
                                widget.dish.details.substring(0, 80) + '...',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            )),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: Row(
                              children: <Widget>[
                                IconAndText(
                                    icon: Icons.star,
                                    iconColor: Theme.of(context).buttonColor,
                                    iconSize: 16,
                                    text: '${widget.dish.rating} Votes',
                                    textColor:
                                        Theme.of(context).primaryColorDark,
                                    textSize: 12),
                                Spacer(),
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {},
                                        splashColor:
                                            Theme.of(context).buttonColor,
                                        child: IconAndText(
                                            icon: Icons.add_shopping_cart,
                                            iconColor:
                                                Theme.of(context).buttonColor,
                                            iconSize: 16,
                                            text:
                                                '\$${widget.dish.price.toInt()}', //\$
                                            textColor: Theme.of(context)
                                                .primaryColorDark,
                                            textSize: 12)))
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
          )),
    );
  }
}
