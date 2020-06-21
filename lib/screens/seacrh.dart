import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/ChipCategoriesSuggested.dart';
import 'package:fith_app__restaurant/sections/PopularsSuggested.dart';
import 'package:flutter/material.dart';

class ScaffoldSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        // body: SearchScreen(),
        body: ScaffoldMainContainer(),
      )
    );
  }
}

class ScaffoldMainContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double statusBarWidth = MediaQuery.of(context).padding.top;
    return Column(
      // width: totalWidth,
      // height: totalHeight,
      children: <Widget>[
        Container(
          width: totalWidth,
          height: totalHeight * 0.10,
          child: FixedTopHeader(),
        ),
        Container(
          width: totalWidth,
          height: totalHeight - (totalHeight*0.24) - statusBarWidth,
          // color: Colors.red,
          child: SingleChildScrollView(
            child: SearchScreen(),
          ),
        )
      ]
    );
  }
}

class FixedTopHeader extends StatefulWidget {//Contenedor del buscador
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
    // double statusBarWidth = MediaQuery.of(context).padding.top;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: statusBarWidth + (statusBarWidth / 2),
          // ),
          Container(
            margin: EdgeInsets.only(
              top: totalWidth * 0.03,
              left: totalWidth * 0.05
            ),
            width: totalWidth,
            height: 40,
            child: RelatedCategories(),
          ),

          Container(
            child: CardCategorySuggested(),
          ),

          Container(
            margin: EdgeInsets.only(
              top: totalWidth * 0.06,
              left: totalWidth * 0.05,
              right: totalWidth * 0.05
            ),
            child: PopularSuggestedWrapper(),
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

//  class PopularSuggestionsWrapper extends StatelessWidget {
//    @override
//    Widget build(BuildContext context) {
//      double totalWidth = MediaQuery.of(context).size.width;
//      return Column(
//        children: <Widget>[
//           Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               'Popular',
//               style: Theme.of(context).textTheme.bodyText1.copyWith(
//                 fontWeight: FontWeight.w700
//               ),
//             ),
//             Text(
//               'See all',
//               style: Theme.of(context).textTheme.bodyText1.copyWith(
//                 color: Theme.of(context).buttonColor,
//                 fontWeight: FontWeight.w700,
//                 decoration: TextDecoration.underline
//               ),
//             )
//           ],
//         ),
//         SizedBox( height: totalWidth * 0.04 ),
//         PopularSuggestions()
//        ],
//      );
//    }
//  }

// class PopularSuggestions extends StatefulWidget {
//   @override
//   _PopularSuggestionsState createState() => _PopularSuggestionsState();
// }

// class _PopularSuggestionsState extends State<PopularSuggestions> {
//   List example = ['1','2','3'];
//   @override
//   Widget build(BuildContext context) {
//     return 
//       Builder(
//         builder: (BuildContext context){
//           return new Column(
//             children: example.map((item) => new PopularCard(name:item)).toList()
//           );
//         }
//       );
//   }
// }

// class PopularCard extends StatelessWidget {
//   final String name;
//   PopularCard({this.name});

//   @override
//   Widget build(BuildContext context) {
//     double totalWidth = MediaQuery.of(context).size.width;
//     double totalHeight = MediaQuery.of(context).size.height;
//     return Container(
//       margin: EdgeInsets.only(bottom: 12),
//       color: Colors.yellow,
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.red,
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: ExactAssetImage(
//                         'assets/populars/Boeuf-bourguignon.jpg'
//                       )
//                     )
//                   ),
//                   width: totalWidth * 0.30,
//                   height: totalWidth * 0.30,
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.only(top:4),
//                     margin: EdgeInsets.only(left: totalWidth * 0.04),
//                     // color: Colors.blue,
//                     height: totalWidth * 0.30,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             CustomChip(name:'12 min', icon: Icons.timer),
//                             CustomChip(name:'8.300', icon: Icons.monetization_on),
//                             Container(
//                               padding: EdgeInsets.only(top:1.8),
//                               width: 30,
//                               height: 18,
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context).buttonColor,
//                                 borderRadius: BorderRadius.circular(10)
//                               ),
//                               child: Text(
//                                 '4.8',
//                                 style: Theme.of(context).textTheme.caption.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                   color: Theme.of(context).primaryColorLight
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Plate name',
//                           style: Theme.of(context).textTheme.caption.copyWith(
//                             fontWeight: FontWeight.w700,
//                             color: Theme.of(context).primaryColorDark
//                           )
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           'a short description about the main element ',
//                           style: Theme.of(context).textTheme.overline.copyWith(
//                             letterSpacing: 0.4,
//                             color: Theme.of(context).primaryColor
//                           )
//                         ),
//                       ],
//                     )
//                   )
//                 )
//               ],
//             ),
//             Container(
//               color: Colors.amber,
//               width: totalWidth,
//               height: 50,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         CircleAvatar(
//                           backgroundColor: Colors.blue,
//                           child: Text('LY'),
//                         ),
//                         SizedBox(
//                           width: totalWidth * 0.01,
//                         ),
//                         Expanded(
//                           child:  Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Text(
//                                'Ahsley seals',
//                                style: Theme.of(context).textTheme.caption.copyWith(
//                                  fontWeight: FontWeight.bold
//                                ),
//                               ),
//                              Text(
//                                'It is a special place to visit in family. The neighborhood is nice, the restaurant´s service is unbeatable, the food is delicious',
//                               style: Theme.of(context).textTheme.caption.copyWith(
//                                 fontSize: 9
//                               ),
//                               )
//                            ],
//                          )
//                         )
//                       ],
//                     ),
//                     width: totalWidth
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 top: totalWidth * 0.01,
//                 right: totalWidth * 0.03
//               ),
//               color: Colors.red,
//               height: totalHeight * 0.07,
//               child: Row(
//                 children: <Widget>[
//                   Container(
//                     color: Colors.blue,
//                     width: totalWidth * 0.30,
//                     child:   Stack(
//                     children: <Widget>[
//                       Positioned(
//                         top: 0,
//                         left: 0,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.amber,
//                           child: Text('LY'),
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         left: totalWidth * 0.16,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.amber,
//                           child: Text('LY'),
//                         ),
//                       ),
//                       Positioned(
//                         top: 0,
//                         left: totalWidth * 0.08,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.amberAccent,
//                           child: Text('LY'),
//                         ),
//                       )
//                     ],
//                   ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       'Para ver todos los comentarios, inicia sesión',
//                       style: Theme.of(context).textTheme.caption,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: MaterialButton(
//                       splashColor: Theme.of(context).buttonColor,
//                       elevation: 0,
//                       padding: EdgeInsets.all(0),
//                       height: 22,
//                       minWidth: 40,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)
//                       ),
//                       onPressed: (){},
//                       color: Theme.of(context).accentColor,
//                       child: Text(
//                         "Iniciar",
//                         style: Theme.of(context).textTheme.caption.copyWith(
//                           color: Theme.of(context).primaryColorDark,
//                           fontWeight: FontWeight.w600 
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
            
//           ],
//         )
//       ),
//     );
//   }
// }

// class CustomChip extends StatelessWidget {
//   final String name;
//   final IconData icon;
//   CustomChip({this.name, this.icon});
//   @override
//   Widget build(BuildContext context) {
//     double totalWidth = MediaQuery.of(context).size.width;
//     return Container(
//       margin: EdgeInsets.only(right: totalWidth * 0.03),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Icon(
//             icon,
//             size: 12.5,
//             color: Theme.of(context).primaryColor
//           ),
//           Text(
//             this.name,
//             style: Theme.of(context).textTheme.caption.copyWith(
//               fontWeight: FontWeight.w700,
//               fontSize: 12.5,
//               color: Theme.of(context).primaryColor
//             ),
//           ),
//         ],
//       )
//     );
    
//   }
// }

