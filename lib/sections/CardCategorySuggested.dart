import 'package:fith_app__restaurant/interfaces/CategorySuggested.dart';
import 'package:flutter/material.dart';

class CardCategorySuggested extends StatefulWidget {
  @override
  CardCategorySuggestedState createState() => CardCategorySuggestedState();
}

class CardCategorySuggestedState extends State<CardCategorySuggested> {
  List<CategorySuggested> _suggestedCategories = [
    CategorySuggested('Asian Food', '900.000 visits', 'assets/banner/asian-food.png'),
    CategorySuggested('Mexican food', '500.00 visits', 'assets/banner/mexican-food.png'),
    CategorySuggested('French food', '800.000 visits', 'assets/banner/french-food.png'),
    CategorySuggested('FastFood', '700.000 visits', 'assets/banner/fast-food.png'),
    CategorySuggested('Soul Food.', '600.000 visits', 'assets/banner/sould-food.png'),
  ];
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top:totalWidth * 0.05),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Padding(
            // padding: EdgeInsets.fromLTRB(totalWidth * 0.05, 0, totalWidth * 0.05, 0 ),
            padding: EdgeInsets.only(left:totalWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Suggestions',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w700
                  ),
                ),
                MaterialButton(
                  // color: Colors.red,
                  padding: EdgeInsets.all(0),
                  splashColor: Theme.of(context).buttonColor,
                  height: 25,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: (){},
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(
              // top:  totalWidth * 0.04,
              left: totalWidth * 0.04
            ),
            width: totalWidth,
            height: totalHeight * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _suggestedCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.only(
                    right: totalWidth * 0.04
                  ),
                  child: Container(
                      width: totalWidth * 0.41,
                      height: totalHeight * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: ExactAssetImage(
                              _suggestedCategories[index].image
                            )
                          )
                        ),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)                           
                          ),
                          padding: EdgeInsets.only(
                            bottom: totalHeight * 0.03,
                            left: (totalWidth * 0.03)+5,
                            right: totalWidth * 0.03
                          ),
                          elevation: 0,
                          onPressed: () {
                          },
                          fillColor: Color(0x000000),
                          splashColor: Theme.of(context).buttonColor,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _suggestedCategories[index].name,
                                  style: Theme.of(context).textTheme.button.copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.w800,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 3.0,
                                        color: Colors.black,
                                        offset: Offset(0, 0)
                                      )
                                    ]
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    _suggestedCategories[index].visits,
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                      color: Theme.of(context).primaryColorLight,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3.0,
                                          color: Colors.black,
                                          offset: Offset(0, 0)
                                        )
                                      ]
                                    ),
                                  )
                                )
                                
                              ],
                            ),
                          )
                        )
                    )
                );
              },
           )
          )
        ],
      ),
    );
  }
}