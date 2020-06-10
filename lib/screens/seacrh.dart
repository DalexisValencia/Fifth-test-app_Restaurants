import 'package:fith_app__restaurant/interfaces/CategorySuggested.dart';
import 'package:flutter/material.dart';
import 'package:fith_app__restaurant/interfaces/categories.dart';

class ScaffoldSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return SafeArea(
      return Scaffold(
        body: SearchScreen(),
      );
    //);
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double statusBarWidth = MediaQuery.of(context).padding.top;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: statusBarWidth + (statusBarWidth / 2),
          ),
          Container(// Searc field
            padding: EdgeInsets.fromLTRB(totalWidth * 0.05, 0, totalWidth * 0.05, 0 ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.width * 0.10,
                  child: RawMaterialButton(
                    shape: CircleBorder(),
                    fillColor: Theme.of(context).accentColor.withOpacity(.1),
                    elevation: 0,
                    splashColor: Theme.of(context).primaryColorDark.withOpacity(0.7),
                    onPressed: () {
                      print('Volver atras');
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                SearchWidget(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  height: MediaQuery.of(context).size.width * 0.10,
                  child: RawMaterialButton(
                    shape: CircleBorder(),
                    elevation: 0,
                    fillColor: Theme.of(context).accentColor.withOpacity(.1),
                    splashColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      print('Configuraciones de tu busqueda');
                    },
                    child: Icon(
                      Icons.settings,
                      size: 30,
                      color: Theme.of(context).primaryColorDark.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: totalWidth * 0.06, left: totalWidth * 0.05),
            width: totalWidth,
            height: 40,
            child: RelatedCategories(),
          ),

          Container(
            child: CategoriesCard(),
          )
          
        ],
      ),
    );
  }
}
/*:::WIDGET SEARCH:::*/
class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _searchForm = GlobalKey<FormState>();

  OutlineInputBorder defaulBorderInput () {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: new BorderSide(
        color: Theme.of(context).cardColor,
        width: 0
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(totalWidth * 0.03, 0, totalWidth * 0.07, 0),
      height: 40,
      width: totalWidth * 0.60,
      child: Form(
        key: _searchForm,
        child: Container(
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search),
              prefixStyle: TextStyle(
                color: Theme.of(context).cardColor,
                fontWeight: FontWeight.w700
              ),
              hintText: 'Search ...',
              hintStyle: TextStyle(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                fontWeight: FontWeight.w400
              ),
              border: defaulBorderInput(),
              focusedBorder: defaulBorderInput(),
              enabledBorder: defaulBorderInput(),
              disabledBorder: defaulBorderInput(),
            ),
          )
        ),
      )
    );
  }
}

class RelatedCategories extends StatefulWidget {
  @override
  _RelatedCategoriesState createState() => _RelatedCategoriesState();
}

class _RelatedCategoriesState extends State<RelatedCategories> {
  List<Category> _relatedCategories = [
    Category('Asian Food', Icons.store_mall_directory),
    Category('Mexican food', Icons.store_mall_directory),
    Category('French food', Icons.store_mall_directory),
    Category('Breakfast', Icons.store_mall_directory),
    Category('FastFood', Icons.store_mall_directory),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _relatedCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return  Container(
          margin: EdgeInsets.only(right: 10),
          child: ActionChip(
            elevation: 1,
            onPressed: () {
              print('seleccionar a los wolves');
            },
            avatar: CircleAvatar(
              backgroundColor: Color(0x00000000),
              child: Icon(
                _relatedCategories[index].icon,
                size: 20,
                color: Theme.of(context).primaryColor
              ),
            ),
            label: Text(
              _relatedCategories[index].name,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600
              ),
            )
          )
        );
        
      },
    );
  }
}

class CategoriesCard extends StatefulWidget {
  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
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
            padding: EdgeInsets.fromLTRB(totalWidth * 0.05, 0, totalWidth * 0.05, 0 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Suggestions',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  'See all',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).buttonColor,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline
                  ),
                )
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(
              top:  totalWidth * 0.04,
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
                            print('categoria seleccionada');
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
                                    fontWeight: FontWeight.w800
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    _suggestedCategories[index].visits,
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                      color: Theme.of(context).primaryColorLight
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