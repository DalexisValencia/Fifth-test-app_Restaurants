import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/DishDetail/dishDetail.dart';
import 'package:fith_app__restaurant/widgets/Card__CustomChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishCardComment extends StatefulWidget {
  final Dishes? dish;
  DishCardComment({
    this.dish,
  });
  @override
  _DishCardCommentState createState() => _DishCardCommentState();
}

class _DishCardCommentState extends State<DishCardComment> {
  late CartBloc instanceCartBloc;
  late FavoritesBloc favoriteBlocInstance;
  @override
  void initState() {
    super.initState();
    instanceCartBloc = BlocProvider.of<CartBloc>(context);
    favoriteBlocInstance = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3.5,
              )
            ],
          ),
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(12, 8, 0, 5),
            elevation: 0,
            splashColor: Colors.red,
            color: Theme.of(context).primaryColorLight,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<PlateDetailScreen>(
                  builder: (BuildContext context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<DishBloc>(
                          create: (BuildContext context) => DishBloc(),
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
                        )
                      ],
                      child: PlateDetailScreen(
                        dish: widget.dish,
                      ),
                    );
                  },
                ),
              );
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: ExactAssetImage(widget.dish!.image!),
                        ),
                      ),
                      width: totalWidth * 0.30,
                      height: totalWidth * 0.30,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 4,
                          right: 12,
                        ),
                        margin: EdgeInsets.only(
                          left: totalWidth * 0.04,
                        ),
                        height: totalWidth * 0.30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                CustomChip(
                                    text: widget.dish!.preparation,
                                    textColor: Theme.of(context).primaryColor,
                                    textSize: 12.5,
                                    icon: Icons.timer,
                                    iconColor: Theme.of(context).primaryColor,
                                    iconSize: 13),
                                CustomChip(
                                    text: formatterPrice(widget.dish!.price),
                                    textColor: Theme.of(context).primaryColor,
                                    textSize: 12.5,
                                    icon: Icons.monetization_on,
                                    iconColor: Theme.of(context).primaryColor,
                                    iconSize: 13),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 1.8),
                                    width: 30,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).buttonColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        widget.dish!.rating.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 6),
                            Text(
                              // comment plate name
                              widget.dish!.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // comment plate description
                              widget.dish!.details!.substring(0, 73) + '...',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(
                                    letterSpacing: 0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: totalWidth * 0.03,
                    right: totalWidth * 0.04,
                  ),
                  padding: EdgeInsets.only(top: totalWidth * 0.01),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 0.3,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  width: totalWidth * 0.80,
                  height: 55,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                splitName(widget.dish!.comments![0].name!),
                              ),
                            ),
                            SizedBox(
                              width: totalWidth * 0.03,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.dish!.comments![0].name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: totalWidth * 0.01,
                                  ),
                                  Text(
                                    widget.dish!.comments![0].comment!
                                            .substring(0, 60) +
                                        '...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(fontSize: 9),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        width: totalWidth,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  splitName(String name) {
    String firtsLetter = name.split(' ')[0].substring(0, 1).toUpperCase();
    String secondLetter = name.split(' ')[1].substring(0, 1).toUpperCase();
    return firtsLetter + secondLetter;
  }
}
