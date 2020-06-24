import 'package:fith_app__restaurant/interfaces/HightlightResturantsInterface.dart';
import 'package:flutter/material.dart';

class HightlightResturantsWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Highlight Restaurants',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w700
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(0),
              height: 25,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              onPressed: (){},
              splashColor: Theme.of(context).buttonColor,
              child: Text(
                'See all',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline
                ),
              ),
            )
          ],
        ),
        HightLightRestaurantsList(),
        SizedBox(
          height: 20,
        )
        // HightlightResturants()
      ],
    );
  }
}

class HightLightRestaurantsList extends StatefulWidget {
  @override
  _HightLightRestaurantsListState createState() => _HightLightRestaurantsListState();
}

class _HightLightRestaurantsListState extends State<HightLightRestaurantsList> {
  List<HightlightResturantsInterface> _hightLights =  [
    HightlightResturantsInterface(
      name: 'House of bistek',
      description: 'detail in this',
      favorite: false,
      image: 'assets/banner/break-fast.png'
    ),
    HightlightResturantsInterface(
      name: 'House of bistek',
      description: 'detail in this',
      favorite: true,
      image: 'assets/banner/mexican-food.png'
    ),
    HightlightResturantsInterface(
      name: 'House of bistek',
      description: 'detail in this',
      favorite: false,
      image: 'assets/populars/Salade-Niçoise.jpg'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context){
        return Column(
          children: _hightLights.map((item) => new HightlightResturants(hightlight: item)).toList(),
        );
      },
    );
  }
}

class HightlightResturants extends StatefulWidget {
  final HightlightResturantsInterface hightlight;
  HightlightResturants({this.hightlight});
  @override
  _HightlightResturantsState createState() => _HightlightResturantsState();
}

class _HightlightResturantsState extends State<HightlightResturants> {
  
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(right: totalWidth * 0.056, bottom: totalHeight * 0.03 ),
      padding: EdgeInsets.fromLTRB(12, 18, 12, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
         image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage(widget.hightlight.image)
          )
      ),
      width: totalWidth,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: totalWidth * 0.12,
                child: RawMaterialButton(
                  elevation: 0,
                  fillColor: Theme.of(context).primaryColor..withOpacity(0.5),
                  padding: EdgeInsets.all(0),
                  shape: CircleBorder(),
                  onPressed: (){},
                  child: Icon(
                    Icons.place,
                    color: Theme.of(context).primaryColorLight,
                    size: 21,
                  )
                ),
              ),
              Container(
                width: totalWidth * 0.50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.hightlight.name,
                        style: Theme.of(context).textTheme.button.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          shadows: [
                            Shadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 2.0,
                              color: Theme.of(context).primaryColorDark,
                            )
                          ]
                        ),
                      ),
                    ),
                    SizedBox(
                      height: totalHeight * 0.007,
                    ),
                    Text(
                      widget.hightlight.description,
                      style: Theme.of(context).textTheme.button.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        shadows: [
                          Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 2.0,
                            color: Theme.of(context).primaryColorDark,
                          )
                        ]
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: totalWidth * 0.12,
                child: RawMaterialButton(
                  elevation: 0,
                  fillColor: widget.hightlight.favorite ? Theme.of(context).buttonColor : Theme.of(context).primaryColor.withOpacity(0.5),
                  padding: EdgeInsets.all(0),
                  shape: CircleBorder(),
                  onPressed: (){},
                  child: Icon(
                    Icons.favorite,
                    color: Theme.of(context).primaryColorLight,
                    size: 21,
                  )
                ),
              )
            ],
          ),
          Container(
            width: totalWidth,
            child: Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                onPressed: (){},
                color: Theme.of(context).buttonColor,
                elevation: 0,
                child: Text(
                  'See more',
                  style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: 13,
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.w500
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(totalWidth*0.10)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}