import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:flutter/material.dart';

class NearYouCard extends StatelessWidget {
  final Dishes dish;
  final int index;
  NearYouCard({this.dish, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            right: index < 9 ? MediaQuery.of(context).size.width * 0.04 : 5),
        width: MediaQuery.of(context).size.width / 2.6,
        child: RaisedButton(
          elevation: 0,
          onPressed: () {
            print(dish);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 3),
          padding: EdgeInsets.all(0),
          color: Theme.of(context).primaryColorLight,
          splashColor: Colors.red,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2.6,
                height: 110,
                decoration: BoxDecoration(
                    // color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: ExactAssetImage(dish.image)
                        // image: ExactAssetImage('assets/banner/sould-food.png')
                        )),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Theme.of(context).primaryColorLight,
                              size: 11,
                            ),
                            Text(
                              dish.rating.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color:
                                          Theme.of(context).primaryColorLight),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.6,
                padding: EdgeInsets.only(top: 6, left: 6),
                child: Column(
                  // mainAxisAlignment: ,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dish.name,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w700),
                    ),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          dish.details.substring(1, 25) + '...',
                          // 'detail product small text',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              wordSpacing: 0.5,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
