import 'package:fith_app__restaurant/interfaces/categories.dart';
import 'package:fith_app__restaurant/screens/restaurant.details.dart';
import 'package:flutter/material.dart';
import 'package:fith_app__restaurant/screens/seacrh.dart';

class HomePageScafold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainTabs();
  }
}

class MainTabs extends StatefulWidget {
  @override
  _MainTabsState createState() => _MainTabsState();
}
class _MainTabsState extends State<MainTabs> {
  int tabStateInit = 0;
  void goToTabs (int tab) {
    setState(() {
      tabStateInit = tab;
    });
    print(tabStateInit);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        resizeToAvoidBottomPadding: false, //avoid flutter ugly alert
        backgroundColor: Theme.of(context).primaryColorLight,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              child: HomePage(),
            ),
            Container(
              child: ScaffoldSearch(),
            ),
            Container(
              child: RestaurantDetailWrapper(),
            ),
            Container(
             child: Text('data 4 $tabStateInit'),
            ),
            Container(
              child: Text('data 5 $tabStateInit'),
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 60,
          child: TabBar(
          labelPadding: EdgeInsets.only(right:5),
          labelColor: Theme.of(context).primaryColorDark,
          unselectedLabelColor: Theme.of(context).accentColor,
          indicatorColor: Color(0X000000),
          onTap: (tab) => goToTabs(tab),
          tabs: [
            Tab(
              iconMargin: EdgeInsets.all(0),
              icon: Icon(Icons.home, size: 20,),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Home", style: TextStyle(fontSize: 12),),
              )
            ),
            Tab(
              iconMargin: EdgeInsets.all(0),
              icon: Icon(Icons.restaurant, size: 20,),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Delicious", style: TextStyle(fontSize: 12),),
              )
            ),
            Tab(
              iconMargin: EdgeInsets.all(0),
              icon: Icon(Icons.class_, size: 20,),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Bookmark", style: TextStyle(fontSize: 12),),
              )
            ),
            Tab(
              iconMargin: EdgeInsets.all(0),
              icon: Icon(Icons.favorite, size: 20,),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Favs", style: TextStyle(fontSize: 12),),
              )
            ),
            Tab(
              iconMargin: EdgeInsets.all(0),
              icon: Icon(Icons.shopping_cart, size: 20,),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Car", style: TextStyle(fontSize: 12),),
              )
            ),
          ] 
        )
        )
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _categories = [
    Category('Break Fast', Icons.store_mall_directory, 'assets/home-categories/category-1.png'),
    Category('Food', Icons.sentiment_neutral, 'assets/home-categories/category-2.png'),
    Category('Wine', Icons.sentiment_neutral, 'assets/home-categories/category-3.png'),
    Category('Coffee', Icons.store_mall_directory, 'assets/home-categories/category-4.png'),
    Category('Meat', Icons.sentiment_neutral, 'assets/home-categories/category-5.png'),
    Category('Beer', Icons.sentiment_neutral, 'assets/home-categories/category-6.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        // color: Colors.amber
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage('assets/banner/break-fast.png')
                )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: (){},
                        elevation: 0,
                        fillColor:  Theme.of(context).primaryColor.withOpacity(0.5),
                        splashColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.arrow_back, color: Colors.white,size: 30),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: (){},
                        elevation: 2.0,
                        splashColor: Theme.of(context).primaryColor,
                        fillColor:  Theme.of(context).primaryColorLight.withOpacity(0.4),
                        child: Icon(Icons.favorite, color: Colors.white,),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      )
                    ],
                  ),
                  ),
                  Positioned(
                    left:  30,
                    top: MediaQuery.of(context).size.height * 0.14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Have a Good day",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight,
                              shadows: [
                                Shadow(
                                  blurRadius: 15.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:5),
                          child: Text(
                            'Restaurants waiting for you',
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColorLight,
                              shadows: [
                                Shadow(
                                  blurRadius: 15.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            ),
                        )
                      ],
                    )
                )
                  
                ],
              ),
            ),
          ),

          Expanded(// what are you looking for
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08,
                    right: MediaQuery.of(context).size.width * 0.08
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // color: Colors.red
                  ),
                  transform: Matrix4.translationValues(0, -MediaQuery.of(context).size.width * 0.07, 0),
                  child: WhatAreYouLookinForForm()
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Colors.amber,
                  child: Builder(
                      builder: (BuildContext context){
                        List<Widget> _categoriesCard = [];
                        _categories.map((item){
                          _categoriesCard.add(
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              margin: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.height * 0.02,
                                right: MediaQuery.of(context).size.height * 0.02
                              ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.30 / 2,
                              child: CardCategorySuggested(category:item),
                            ),
                          );
                        }).toList();
                        return Wrap(
                          children: _categoriesCard,
                        );
                      }
                  ),
                )


                // Container(
                //   transform: Matrix4.translationValues(0, -MediaQuery.of(context).size.height * 0.01, 0),
                //   color: Colors.red,
                //   padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height / 2 * 0.75,
                //   child: GridView.count(
                //     padding: EdgeInsets.all(0),
                //     crossAxisCount: 3,
                //     children: List.generate(_categories.length, (index){
                  //       return Card(
                  //         margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
                  //         elevation: 1,
                  //         child: RaisedButton(
                  //           onPressed: (){},
                  //           color: Theme.of(context).primaryColorLight,
                  //           splashColor: Colors.red,
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: <Widget>[
                  //               Icon(
                  //                 _categories[index].icon,
                  //                 size: 36,
                  //               ),
                  //               FittedBox(
                  //                 fit: BoxFit.scaleDown,
                  //                 child: Text("${_categories[index].name}"),
                  //               )
                  //             ],
                  //           )
                  //         )
                  //       );
                  //     })
                  // )
                // )
              ],
            ),
          ),
        ]
      ),
    );
  }
}

class WhatAreYouLookinForForm extends StatefulWidget {
  @override
  _WhatAreYouLookinForFormState createState() => _WhatAreYouLookinForFormState();
}

class _WhatAreYouLookinForFormState extends State<WhatAreYouLookinForForm> {
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        splashColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        elevation: 4,
        padding: EdgeInsets.fromLTRB(14, 13, 10, 13),
        color: Theme.of(context).primaryColorLight,
        onPressed: (){
          print("hero animation");
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Theme.of(context).primaryColorDark,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Text(
              'What are you looking for?',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 12
              ),
            )
          ],
        ),
      )
    );
    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   color: Colors.red,
    //   child: Form(
    //     key: _formKey,
    //     child: Column(
    //       children: <Widget>[
    //         TextFormField(
    //           decoration: InputDecoration(
    //             filled: true,
    //             fillColor: Theme.of(context).primaryColorLight,
    //             hintText: 'What are you looking For?',
    //             disabledBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(20),
    //               borderSide: BorderSide(
    //                 color: Theme.of(context).primaryColorLight,
    //                 width: 2
    //               ) 
    //             ),
    //             focusedBorder: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //               borderSide: BorderSide(
    //                 color: Theme.of(context).primaryColorLight,
    //                 width: 2
    //               ) 
    //             ),
    //             hintStyle: TextStyle(
    //               color: Theme.of(context).primaryColorDark
    //             ),
    //             prefixIcon:Icon(Icons.search) 
    //           ),
    //         )
    //       ],
    //     )
    //   ),
    // );
  }
}

class CardCategorySuggested extends StatefulWidget {
  final Category category;
  CardCategorySuggested({this.category});

  @override
  _CardCategorySuggestedState createState() => _CardCategorySuggestedState();
}

class _CardCategorySuggestedState extends State<CardCategorySuggested> {
  @override
  Widget build(BuildContext context) {
    print( widget.category );
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7)
      ),
      onPressed: (){},
      color: Theme.of(context).primaryColorLight,
      splashColor: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  widget.category.iconSource
                )
              )
            ),
          ),
          // Icon(
          //   widget.category.icon,
          //   size: 36,
          //   color: Theme.of(context).primaryColorDark,
          // ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.category.name,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          )
        ],
      ),
      //     margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
      //     elevation: 1,
      //     child: RaisedButton(
      //       onPressed: (){},
      //       color: Theme.of(context).primaryColorLight,
      //       splashColor: Colors.red,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Icon(
      //             _categories[index].icon,
      //             size: 36,
      //           ),
      //           FittedBox(
      //             fit: BoxFit.scaleDown,
      //             child: Text("${_categories[index].name}"),
      //           )
      //         ],
      //       )
      //     )
      //   );
      // })
    );
  }
}