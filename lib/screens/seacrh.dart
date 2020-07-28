import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/ChipCategoriesSuggested.dart';
import 'package:fith_app__restaurant/sections/PopularsSuggested.dart';
import 'package:flutter/material.dart';

class ScaffoldSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColorLight,
      // body: SearchScreen(),
      body: ScaffoldMainContainer(),
    ));
  }
}

class ScaffoldMainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double statusBarWidth = MediaQuery.of(context).padding.top;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        //child: Material(
        //elevation: 5.0,
        // shadowColor: Theme.of(context).primaryColorDark,
        child: Container(
          height: totalHeight * 0.10,
          width: totalWidth,
          color: Theme.of(context).primaryColorLight,
          child: FixedTopHeader(),
        ),
        // ),
      ),
      Container(
        width: totalWidth,
        height: totalHeight - (totalHeight * 0.24) - statusBarWidth,
        child: SingleChildScrollView(
          child: SearchScreen(),
        ),
      )
    ]));
  }
}

class FixedTopHeader extends StatefulWidget {
  //Contenedor del buscador
  @override
  FixedTopHeaderState createState() => FixedTopHeaderState();
}

class FixedTopHeaderState extends State<FixedTopHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              size: 25,
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
              Icons.more_vert,
              size: 23,
              color: Theme.of(context).primaryColorDark.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: totalWidth * 0.03, left: totalWidth * 0.05),
            width: totalWidth,
            height: 40,
            child: RelatedCategories(),
          ),
          Container(
            child: CardCategorySuggested(),
          ),
          Container(
            margin: EdgeInsets.only(
                top: totalWidth * 0.06, left: totalWidth * 0.05),
            child: PopularSuggestedWrapper(),
          ),
          Container(
            margin: EdgeInsets.only(
                top: totalWidth * 0.02, left: totalWidth * 0.05),
            child: HightlightResturantsWrapper(),
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

  OutlineInputBorder defaulBorderInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide:
            new BorderSide(color: Theme.of(context).cardColor, width: 0));
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Hero(
        tag: 'search-field',
        child: Container(
            margin:
                EdgeInsets.fromLTRB(totalWidth * 0.03, 0, totalWidth * 0.07, 0),
            height: 40,
            width: totalWidth * 0.63,
            child: Form(
              key: _searchForm,
              child: Container(
                  child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Theme.of(context).highlightColor, // .withOpacity(0.7)
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search),
                  prefixStyle: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontWeight: FontWeight.w700),
                  hintText: 'Search ...',
                  hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.w600),
                  border: defaulBorderInput(),
                  focusedBorder: defaulBorderInput(),
                  enabledBorder: defaulBorderInput(),
                  disabledBorder: defaulBorderInput(),
                ),
              )),
            )));
  }
}
