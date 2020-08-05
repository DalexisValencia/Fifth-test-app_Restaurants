import 'package:fith_app__restaurant/widgets/iconAndText.dart';
import 'package:flutter/material.dart';

class QuickView extends StatefulWidget {
  @override
  _QuickViewState createState() => _QuickViewState();
}

class _QuickViewState extends State<QuickView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //   boxShadow: [
          //   BoxShadow(
          //     color: Theme.of(context).primaryColor.withOpacity(0.5),
          //     blurRadius: 5,
          //     offset: Offset(0, 2),
          //   )
          // ],
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: 5),
      child: MaterialButton(
          elevation: 1,
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(0),
          splashColor: Colors.red,
          onPressed: () {},
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
                          image: ExactAssetImage(
                              'assets/populars/Salade-Niçoise.jpg'))),
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
                            "Turkay Gravy Secrets",
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
                                "Este es un texto del detallado del restaurante de dos lineas",
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
                                    text: '4.8 Votes',
                                    textColor:
                                        Theme.of(context).primaryColorDark,
                                    textSize: 12),
                                Spacer(),
                                IconAndText(
                                    icon: Icons.attach_money,
                                    iconColor:
                                        Theme.of(context).primaryColorDark,
                                    iconSize: 16,
                                    text: '47.00', //\$
                                    textColor:
                                        Theme.of(context).primaryColorDark,
                                    textSize: 12)
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
