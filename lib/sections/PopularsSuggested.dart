import 'package:fith_app__restaurant/interfaces/populars.dart';
import 'package:flutter/material.dart';

class PopularSuggestedWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Column(
       children: <Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Popular',
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
        PopularSuggestions(),
       ],
     );
   }
}

class PopularSuggestions extends StatefulWidget {
  @override
  _PopularSuggestionsState createState() => _PopularSuggestionsState();
}

class _PopularSuggestionsState extends State<PopularSuggestions> {
  List<Popular> example = [
    Popular(
      'Boeuf bourguignon',
      'assets/populars/Boeuf-bourguignon.jpg',
      'The dish hails from the same region as coq au vin – that’s Burgundy in eastern France – and there are similarities between the two dishes. Boeuf bourguignon is essentially a stew made from beef braised in red wine, beef broth,',
      '20 min',
      '4.6',
      '32.000',
      RelatedComment(
        'Jessica simons',
        'image',
        'It is a special place to visit in family. The neighborhood is nices'
      ),
      Color(0xFFE76D6F)
    ),
    Popular(
      'Chocolate soufflé',
      'assets/populars/Chocolate-souffle.jpg',
      'The word soufflé comes from the French verb ‘to blow’ and, and the name suggests, this is a light, airy dessert. The dish dates back to the early 18th century and nowadays is a staple on dessert menus around the world.',
      '15 min',
      '4.8',
      '17.000',
      RelatedComment(
        'Miguel Rios',
        'image',
        'It is a special place to visit in family. The neighborhood is nice'
      ),
      Color(0xFFFFB60E)
    ),
    Popular(
      'Salade Niçoise',
      'assets/populars/Salade-Niçoise.jpg',
      'The word soufflé comes from the French verb ‘to blow’ and, and the name suggests, this is a light, airy dessert. The dish dates back to the early 18th century and nowadays is a staple on dessert menus around the world.',
      '40 min',
      '4.7',
      '17.000',
      RelatedComment(
        'Nataly Santana',
        'image',
        'It is a special place to visit in family. The neighborhood is nice.'
      ),
      Color(0xFF4F57D5)
    )
  ];
  @override
  Widget build(BuildContext context) {
    return 
      Builder(
        builder: (BuildContext context){
          return new Column(
            children: example.map((item) => new PopularCard(comment:item)).toList()
          );
        }
      );
  }
}

class PopularCard extends StatelessWidget {
  final Popular comment;
  PopularCard({this.comment});

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(
        right: totalWidth * 0.05
      ),
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
                blurRadius: 3.5
              )
            ]
          ),
          padding: EdgeInsets.fromLTRB( 12, 8, 0, 5 ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage(
                          comment.image
                        )
                      )
                    ),
                    width: totalWidth * 0.30,
                    height: totalWidth * 0.30,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:4, right: 12),
                      margin: EdgeInsets.only(left: totalWidth * 0.04),
                      height: totalWidth * 0.30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CustomChip(name: comment.timePreparation, icon: Icons.timer),
                              CustomChip(name: comment.price, icon: Icons.monetization_on),
                              Container(
                                padding: EdgeInsets.only(top:1.8),
                                width: 30,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: comment.shipColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text(
                                  comment.quality,
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColorLight
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(// comment plate name
                            comment.name,
                            style: Theme.of(context).textTheme.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColorDark
                            )
                          ),
                          SizedBox(height: 5),
                          Text(// comment plate description
                            comment.description.substring(0, 73) + '...',
                            style: Theme.of(context).textTheme.overline.copyWith(
                              letterSpacing: 0,
                              color: Theme.of(context).primaryColor
                            )
                          ),
                        ],
                      )
                    )
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: totalWidth * 0.03, right: totalWidth * 0.04),
                padding: EdgeInsets.only(top: totalWidth * 0.01),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.3,
                      color: Theme.of(context).primaryColor
                    )
                  )
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
                            child: Text('LY'),
                          ),
                          SizedBox(
                            width: totalWidth * 0.03,
                          ),
                          Expanded(
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                comment.relatedComment.name,
                                style: Theme.of(context).textTheme.caption.copyWith(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                height: totalWidth * 0.01,
                              ),
                              Text(
                                comment.relatedComment.comment.substring(0, 60) + '...',
                                style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 9
                                ),
                              )
                            ],
                          )
                          )
                        ],
                      ),
                      width: totalWidth
                    )
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(
              //     top: totalWidth * 0.01,
              //     right: totalWidth * 0.03
              //   ),
              //   height: totalHeight * 0.07,
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         width: totalWidth * 0.30,
              //         child:   Stack(
              //         children: <Widget>[
              //           Positioned(
              //             top: 0,
              //             left: 0,
              //             child: CircleAvatar(
              //               backgroundColor: Colors.amber,
              //               child: Text('LY'),
              //             ),
              //           ),
              //           Positioned(
              //             top: 0,
              //             left: totalWidth * 0.16,
              //             child: CircleAvatar(
              //               backgroundColor: Colors.amber,
              //               child: Text('LY'),
              //             ),
              //           ),
              //           Positioned(
              //             top: 0,
              //             left: totalWidth * 0.08,
              //             child: CircleAvatar(
              //               backgroundColor: Colors.amberAccent,
              //               child: Text('LY'),
              //             ),
              //           )
              //         ],
              //       ),
              //       ),
              //       Expanded(
              //         flex: 2,
              //         child: Container(
              //           child: Center(
              //             child: Text(
              //               'log in to see all comments',
              //               style: Theme.of(context).textTheme.caption.copyWith(
              //                 fontSize: 12
              //               ),
              //             ),
              //           ),
              //         ),
                      
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: MaterialButton(
              //           splashColor: Theme.of(context).buttonColor,
              //           elevation: 0,
              //           padding: EdgeInsets.all(0),
              //           height: 22,
              //           minWidth: 40,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20)
              //           ),
              //           onPressed: (){},
              //           color: Theme.of(context).accentColor,
              //           child: Text(
              //             "Iniciar",
              //             style: Theme.of(context).textTheme.caption.copyWith(
              //               color: Theme.of(context).primaryColorDark,
              //               fontWeight: FontWeight.w600 
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        )
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String name;
  final IconData icon;
  CustomChip({this.name, this.icon});
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: totalWidth * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:1),
            // color: Colors.red,
            child:Icon(
              icon,
              size: 13,
              color: Theme.of(context).primaryColor
            ),
          ),
          SizedBox( width: totalWidth * 0.005),
          Text(
            this.name,
            style: Theme.of(context).textTheme.caption.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 12.5,
              color: Theme.of(context).primaryColor
            ),
          ),
        ],
      )
    );
    
  }
}