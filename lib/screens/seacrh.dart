import 'package:flutter/material.dart';

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
            // padding: EdgeInsets.only(left: totalWidth * 0.02 ),
            width: totalWidth,
            // color: Colors.red,
            height: 40,
            child: RelatedCategories(),
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return  Container(
          margin: EdgeInsets.only(right: 10),
          child: ActionChip(
            elevation: 1,
            onPressed: () {
              print('seleccionar a los wolves');
            },
            avatar: CircleAvatar(
              child: Icon(
                Icons.verified_user,
                size: 18,
              ),
            ),
            label: Text('chip')
          )
        );
        
      },
    );
  }
}