import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/widgets/iconAndText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteListAvailablePlates extends StatefulWidget {
  final List<Dishes> dishes;
  CompleteListAvailablePlates({this.dishes});
  @override
  _CompleteListAvailablePlatesState createState() =>
      _CompleteListAvailablePlatesState();
}

class _CompleteListAvailablePlatesState
    extends State<CompleteListAvailablePlates> {
  DishBloc instanceDishBloc;
  @override
  void initState() {
    super.initState();
    instanceDishBloc = BlocProvider.of<DishBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.dishes.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // print('ir al detalle');
            instanceDishBloc.add(DishStart(currentDish: widget.dishes[index]));
            // Navigator.of(context)
            //     .push(MaterialPageRoute<PlateDetailWrapper>(builder: (context) {
            //   return BlocProvider.value(
            //     value: instanceDishBloc,
            //     child: PlateDetailWrapper(),
            //   );
            // }));
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
                      offset: Offset(0, 0))
                ]),
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
                            image:
                                ExactAssetImage(widget.dishes[index].image))),
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
                                  MediaQuery.of(context).size.height * 0.01),
                              decoration: BoxDecoration(
                                  color:
                                      widget.dishes[index].promotionLabel.color,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                widget.dishes[index].promotionLabel.label,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 12),
                              ),
                            ))
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
                        right: MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconAndText(
                            icon: Icons.monetization_on,
                            iconColor: Theme.of(context).primaryColor,
                            iconSize: 14,
                            text:
                                "\$${formatterPrice(widget.dishes[index].price)}",
                            textColor: Theme.of(context).primaryColor,
                            textSize: 12),
                        SizedBox(height: 5),
                        Text(
                          widget.dishes[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Builder(builder: (BuildContext context) {
                              List<Widget> starts = [];
                              var obj = [
                                1,
                                2,
                                3,
                                4,
                                5
                              ]; // Calificamos las 5 estrellas
                              for (var prop in obj) {
                                Color _startColor =
                                    Theme.of(context).accentColor;
                                if (prop <=
                                    widget.dishes[index].rating.toInt()) {
                                  _startColor = Theme.of(context).buttonColor;
                                }
                                if (prop >
                                    widget.dishes[index].rating.toInt()) {
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
                            }),
                            SizedBox(
                              width: 8,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Average ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: '${widget.dishes[index].rating}%',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Theme.of(context).primaryColor))
                                ]))
                          ],
                        ),
                        SizedBox(height: 7),
                        IconAndText(
                            icon: Icons.access_time,
                            iconColor: Theme.of(context).primaryColor,
                            iconSize: 14,
                            text:
                                "Preparation: ${widget.dishes[index].preparation}",
                            textColor: Theme.of(context).primaryColor,
                            textSize: 12),
                        SizedBox(
                          height: 5,
                        ),
                        widget.dishes[index].promotionLabel.active == true
                            ? Builder(builder: (BuildContext context) {
                                List<Widget> _shipPrices = [];
                                widget.dishes[index].promotionLabel
                                    .pricePromotions
                                    .asMap()
                                    .entries
                                    .map((item) => {
                                          _shipPrices.add(
                                            Expanded(
                                                child: Container(
                                              margin: EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02),
                                              child: Chip(
                                                  backgroundColor: item.key == 0
                                                      ? Theme.of(context)
                                                          .buttonColor
                                                      : Theme.of(context)
                                                          .accentColor,
                                                  label: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        '${item.value.amount}-\$${formatterPrice(item.value.price)}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColorLight),
                                                      ))),
                                            )),
                                          )
                                        })
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
      },
    );
  }
}
