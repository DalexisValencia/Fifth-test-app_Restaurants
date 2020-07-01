import 'package:fith_app__restaurant/interfaces/availableForLunch.dart';
import 'package:flutter/material.dart';

List<AvailablePlatesForLunch> availablePlates = [
    AvailablePlatesForLunch(
      flagLabelText: 'Ready In Seconds',
      flagLabelColor: Color(0xFFE76D6F),
      imagePlate: 'assets/banner/mexican-food.png',
      price: '\$12.000  -  \$10.000',
      plateName: 'House of ilumin san diego',
      starts: 3,
      qualifiers: '3.5',
      votes: '210 votes',
      preparationTime: 'Preparation: 12 minutes',
      prices: [
        PricesShip(
          amount: 1,
          price: '\$12.000',
          active: true
        ),
        PricesShip(
          amount: 2,
          price: '\$21.000',
          active: false
        ),
        PricesShip(
          amount: 3,
          price: '\$30.000',
          active: false
        )
      ]
    ),
    AvailablePlatesForLunch(
      flagLabelText: 'Special For You',
      flagLabelColor: Color(0xFF4F57D5),
      imagePlate: 'assets/banner/mexican-food.png',
      price: '\$22.000  -  \$55.000',
      plateName: 'House of ilumin san diego',
      starts: 4,
      qualifiers: '4.0',
      votes: '150 votes',
      preparationTime: 'Preparation: 5 minutes',
      prices: [
        PricesShip(
          amount: 1,
          price: '\$22.000',
          active: false
        ),
        PricesShip(
          amount: 2,
          price: '\$41.000',
          active: true
        ),
        PricesShip(
          amount: 3,
          price: '\$55.000',
          active: false
        )
      ]
    ),
    AvailablePlatesForLunch(
      flagLabelText: 'Best Promotion',
      flagLabelColor: Color(0xFFFFB60E),
      imagePlate: 'assets/banner/mexican-food.png',
      price: '\$44.000  -  \$150.000',
      plateName: 'House of ilumin san diego',
      starts: 4,
      qualifiers: '4.0',
      votes: '150 votes',
      preparationTime: 'Preparation: 15 minutes',
      prices: [
        PricesShip(
          amount: 1,
          price: '\$44.000',
          active: false
        ),
        PricesShip(
          amount: 2,
          price: '\$80.000',
          active: false
        ),
        PricesShip(
          amount: 3,
          price: '\$150.000',
          active: true
        )
      ]
    )
  ];

  class CompleteListAvailablePlates extends StatefulWidget {
    @override
    _CompleteListAvailablePlatesState createState() => _CompleteListAvailablePlatesState();
  }
  
  class _CompleteListAvailablePlatesState extends State<CompleteListAvailablePlates> {
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availablePlates.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.only(
              top:  MediaQuery.of(context).size.height * 0.02,
              right:MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.025,
              bottom:  MediaQuery.of(context).size.height * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0,0)
                )
              ]
            ),
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
                          image: ExactAssetImage(availablePlates[index].imagePlate)
                        )
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top:  MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.width * 0.03,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.height * 0.01,
                                MediaQuery.of(context).size.width * 0.05,
                                MediaQuery.of(context).size.height * 0.01
                              ),
                              decoration: BoxDecoration(
                                color: availablePlates[index].flagLabelColor,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Text(
                                availablePlates[index].flagLabelText,
                                style: Theme.of(context).textTheme.button.copyWith(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 12
                                ),
                              ),
                            )
                          )
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
                        right: MediaQuery.of(context).size.width * 0.02
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        ),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.monetization_on,
                                size: 16,
                                color: Theme.of(context).primaryColor
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                availablePlates[index].price,
                                style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor
                                ),
                              )
                            ],
                          ),
                          SizedBox( height: 5 ),
                          Text(
                            availablePlates[index].plateName,
                            style: Theme.of(context).textTheme.button.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox( height: 5 ),
                          Row(
                            children: <Widget>[
                              Builder(
                                builder: (BuildContext context){
                                  List<Widget> starts = [];
                                  var obj = [1,2,3,4,5];// Calificamos las 5 estrellas
                                  for (var prop in obj) {
                                    Color _startColor = Theme.of(context).accentColor;
                                    if (prop <= availablePlates[index].starts) {
                                      _startColor = Theme.of(context).buttonColor;
                                    }
                                    if (prop > availablePlates[index].starts) {
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
                                }
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: availablePlates[index].qualifiers,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '  ${availablePlates[index].votes}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor
                                      )
                                    )
                                  ]
                                )
                              )
                            ],
                          ),
                          SizedBox( height: 7 ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Theme.of(context).primaryColor
                              ),
                              SizedBox( width: 3 ),
                              Text(
                                availablePlates[index].preparationTime,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Theme.of(context).primaryColor
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Builder(
                            builder: (BuildContext context){
                              List<Widget> _shipPrices = [];
                              availablePlates[index].prices.map((item) => {
                                _shipPrices.add(
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width * 0.02
                                      ),
                                      child: Chip(
                                        backgroundColor: item.active ? Theme.of(context).buttonColor : Theme.of(context).accentColor,
                                        label: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            '${item.amount} - ${item.price}',
                                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColorLight
                                            ),
                                          ) 
                                        )
                                      ),
                                    )
                                  ),
                                )
                              }).toList();
                              return Row(
                                children: _shipPrices,
                              );
                            }
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
          );
        },
      );
    }
  }