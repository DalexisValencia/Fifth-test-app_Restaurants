import 'package:fith_app__restaurant/interfaces/populars.dart';
import 'package:flutter/material.dart';

class PopularSuggestedWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     double totalWidth = MediaQuery.of(context).size.width;
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
        SizedBox( height: totalWidth * 0.04 ),
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
        'It is a special place to visit in family. The neighborhood is nice, the restaurant´s service is unbeatable, the food is delicious'
      )
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
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(0),
      // color: Colors.red,
      margin: EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.fromLTRB( 12, 8, 10, 5 ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
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
                      padding: EdgeInsets.only(top:4, right: 15),
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
                                  color: Theme.of(context).buttonColor,
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
                          SizedBox(height: 10),
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
                width: totalWidth,
                height: 50,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text('LY'),
                          ),
                          SizedBox(
                            width: totalWidth * 0.01,
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
                              Text(
                                comment.relatedComment.comment,
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
              Container(
                padding: EdgeInsets.only(
                  top: totalWidth * 0.01,
                  right: totalWidth * 0.03
                ),
                height: totalHeight * 0.07,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: totalWidth * 0.30,
                      child:   Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Text('LY'),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: totalWidth * 0.16,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Text('LY'),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: totalWidth * 0.08,
                          child: CircleAvatar(
                            backgroundColor: Colors.amberAccent,
                            child: Text('LY'),
                          ),
                        )
                      ],
                    ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Center(
                          child: Text(
                            'log in to see all comments',
                            style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 12
                            ),
                          ),
                        ),
                      ),
                      
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        splashColor: Theme.of(context).buttonColor,
                        elevation: 0,
                        padding: EdgeInsets.all(0),
                        height: 22,
                        minWidth: 40,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: (){},
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "Iniciar",
                          style: Theme.of(context).textTheme.caption.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w600 
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
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
          Icon(
            icon,
            size: 12.5,
            color: Theme.of(context).primaryColor
          ),
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