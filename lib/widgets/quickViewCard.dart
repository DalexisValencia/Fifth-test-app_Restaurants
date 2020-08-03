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
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 2),
            ) //spreadRadius: 5)
          ],
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            print("pueblo griefo");
          },
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
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
                  //color: Colors.red,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Turkay Gravy Secrets",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.015),
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
                              right: MediaQuery.of(context).size.width * 0.03),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconAndText(
                                icon: Icons.star,
                                iconColor: Theme.of(context).buttonColor,
                                text: '4.8 Votes',
                                textColor: Theme.of(context).primaryColorDark,
                              ),
                              Spacer(),
                              IconAndText(
                                icon: Icons.attach_money,
                                iconColor: Theme.of(context).primaryColorDark,
                                text: '\$47.00',
                                textColor: Theme.of(context).primaryColorDark,
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
          )),
    );
  }
}
