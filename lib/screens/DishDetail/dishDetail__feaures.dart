import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:flutter/material.dart';

//Especificaciones del plato. Icono - Nombre - Descripción y calificaciones
class DetailFeatures extends StatelessWidget {
  final Dishes? dish;
  DetailFeatures({
    this.dish,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Theme.of(context).buttonColor,
            ),
            child: Icon(
              Icons.restaurant_menu,
              size: 30,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.07,
                0,
                MediaQuery.of(context).size.width * 0.07,
                0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Center(
              child: Text(
                dish!.name!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          Container(
            child: Text(
              "\$${formatterPrice(dish!.price)}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
            ),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.008,
            ),
            // color: Colors.white,
            child: Text(
              dish!.details!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.012,
            ),
            child: Builder(
              builder: (BuildContext context) {
                int rating = dish!.rating!.toInt();
                List repeat = new List.filled(3, 0, growable: true);
                List<Widget> stars = [];
                repeat.asMap().entries.map((e) {
                  int index = (e.key + 1);
                  if (index <= rating) {
                    stars.add(
                      Icon(
                        Icons.star,
                        size: 22,
                        color: Theme.of(context).buttonColor,
                      ),
                    );
                  }
                  if (index > rating) {
                    stars.add(
                      Icon(
                        Icons.star,
                        size: 22,
                        color: Theme.of(context).accentColor,
                      ),
                    );
                  }
                }).toList();

                stars.add(
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      '120.000 votes',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).primaryColorDark,
                          ),
                    ),
                  ),
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: stars,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
