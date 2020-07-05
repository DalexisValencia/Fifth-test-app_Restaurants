// import 'package:fith_app__restaurant/interfaces/availableForLunch.dart';
import 'package:fith_app__restaurant/interfaces/ContactInterface.dart';
import 'package:fith_app__restaurant/sections/CardAvailableForLunch.dart';
import 'package:fith_app__restaurant/sections/CardCategorySuggested.dart';
import 'package:fith_app__restaurant/sections/CardsHighlightRestaurants.dart';
import 'package:fith_app__restaurant/sections/CircleOptionDetailRestaurant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantDetailWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.03
              ),
              width: MediaQuery.of(context).size.width,
              // color: Colors.amber,
              child: FixedTopDetailRestaurant(),
            ),
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.03),
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.09,
                right: MediaQuery.of(context).size.width * 0.058
              ),
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child:  TitleAndShortDescription(),
            ),
            WrapperMap(),
            DetailHighlightProduct(),
            ExploreTheMenu()
          ],
        )
      )
    );
  }
}
//Header con icono de regresar y lupa de busqueda
class FixedTopDetailRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        MaterialButton(
          minWidth: 40,
          elevation: 0,
          onPressed: (){},
          color: Theme.of(context).highlightColor,
          padding: EdgeInsets.all(0),
          shape: CircleBorder(),
          child: Icon(
            Icons.arrow_back,
            size: 22,
            color: Theme.of(context).primaryColorDark
          ),
        ),
        MaterialButton(
          minWidth: 40,
          elevation: 0,
          onPressed: (){},
          color: Theme.of(context).highlightColor,
          padding: EdgeInsets.all(0),
          shape: CircleBorder(),
          child: Icon(
            Icons.search,
            size: 20,
            color: Theme.of(context).primaryColorDark
          ),
        )
      ],
    );
  }
}

class TitleAndShortDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Expanded(
        flex: 9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "FOR COUPLE",
              style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text("New York, America")
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: RawMaterialButton(
          elevation: 0,
          onPressed: (){},
          fillColor: Theme.of(context).highlightColor,
          padding: EdgeInsets.all(0),
          shape: CircleBorder(),
          child: Icon(
            Icons.my_location,
            size: 22,
            color: Theme.of(context).primaryColorDark
          ),
        ),
      )
    ], 
    );
  }
}

class WrapperMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.05
      ),
      color: Theme.of(context).accentColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
    );
  }
}

class DetailHighlightProduct extends StatefulWidget {
  @override
  _DetailHighlightProductState createState() => _DetailHighlightProductState();
}

class _DetailHighlightProductState extends State<DetailHighlightProduct> {
  Widget _wrapperHeader () => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Available for lunch now',
        style: Theme.of(context).textTheme.bodyText1.copyWith(
          fontWeight: FontWeight.w700
        ),
      ),
      MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
        ),
        onPressed: (){},
        splashColor: Theme.of(context).buttonColor,
        child: Text(
          'view all',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            color: Theme.of(context).buttonColor,
            fontWeight: FontWeight.bold 
          ),
        ),
      )
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.01,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07
            ),
            child: _wrapperHeader(),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.035
            ),
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 2/2.010,
                child: Container(
                  child: CompleteListAvailablePlates(),
                ),
              ),
            )
            
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class ExploreTheMenu extends StatefulWidget {
  @override
  _ExploreTheMenuState createState() => _ExploreTheMenuState();
}

class _ExploreTheMenuState extends State<ExploreTheMenu> {

  Widget _header () => Container(
    margin: EdgeInsets.only(
      left:  MediaQuery.of(context).size.width * 0.07
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Explore the Menu',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontWeight: FontWeight.w700
          ),
        ),
        MaterialButton(
          onPressed: (){},
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Theme.of(context).buttonColor,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    )
  );

  List _chipsLikeMenuList = [
    'Champiñones (100)', 'Ensaladas (200)',  'Frescos (120)', 
    'Almuerzos (123)', 'Comida Rapida (10)'
  ];

  Widget _chipsAsMenu () {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left:  MediaQuery.of(context).size.width * 0.07
      ),
      child: Builder(builder: (BuildContext context){
        List<Widget> chips = [];
          _chipsLikeMenuList.map((e){
            chips.add(
              Container(
                child: Chip(
                  label: Text(
                    '$e',
                    maxLines: 1,
                  )
                )
              )
            );
          }
        ).toList();
        return Wrap(
          runSpacing: -8,
          spacing: 5,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: chips,
        );
      })
    );
  }
  
  Widget _optionsToContact () {
    return Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07
          ),
          // color: Colors.red,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleOption(
              icon: Icons.share,
              title: 'Share',
            ),
            CircleOption(
              icon: Icons.comment,
              title: 'Comment',
            ),
            CircleOption(
              icon: Icons.calendar_today,
              title: 'Schedule',
            ),
            CircleOption(
              icon: Icons.assignment,
              title: 'Rerserve',
            )
          ],
        )
      );
  }
  
  List<ContactInterface> _contactPhones = [
    ContactInterface( name: 'Phone',  phone: '7153914', action: 'call' ),
    ContactInterface( name: 'Mail',  phone: 'company@contact.com', action: 'mail' ),
    ContactInterface( name: 'Whatsapp',  phone: '7153914', action: 'whatsapp' ),
    ContactInterface( name: 'Average Cost',  phone: '\$12.00 - \$44.00', action: 'none' )
  ];
  Widget _contactColumnPhones () {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.07,
        right: MediaQuery.of(context).size.width * 0.07
      ),
      child: Builder(
        builder: (BuildContext context){
          List<Widget> contacts = [];
          _contactPhones.map((e){
            contacts.add(
              Container(
                height: 40,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border(
                    bottom: BorderSide(
                      width: 0.3,
                      color: Theme.of(context).primaryColor
                    )
                  )
                ),
                child: SizedBox.expand(
                  child: MaterialButton(
                    onPressed: () async{
                      const String url = 'tel://7153914';
                      bool showSnackBar = false;
                      String alertSnackBar = '';
                      if (e.action == 'call'){
                        if (await canLaunch(url)) {
                          launch(url);
                        }else{
                          showSnackBar = true;
                          alertSnackBar = 'Ha ocurrido un error';
                        }
                      }
                      if (e.action == 'mail'){
                        if (await canLaunch(url)){
                          final Uri _emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: e.phone,
                              queryParameters: {
                                'suject': 'Username and lastName'
                              }
                          );

                          launch(_emailLaunchUri.toString());
                        }else{
                          showSnackBar = true;
                          alertSnackBar = 'No hemos podido abrir el email ';
                        }
                      }
                      if (e.action == 'whatsapp') {
                        print('abrir whatsapp');
                        
                        var whatsappUrl ="whatsapp://send?phone=3107127993";
                        if (await canLaunch(url)) {
                          launch(whatsappUrl);
                        }else{
                          showSnackBar = true;
                          alertSnackBar = '¿Puede revisar si whatsapp esta instalado?';
                        }
                      }
                      if (showSnackBar) {
                        final snackBar = SnackBar(
                          content: Text(
                            alertSnackBar,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).primaryColorLight
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColorDark,
                        );
                      Scaffold.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(e.name),
                        FittedBox(
                          child:Text(
                            e.phone,
                            style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).buttonColor,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ),
              )
            );
          }).toList();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: contacts,
          );
        }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _header(),
          _chipsAsMenu(),
          Container(
            padding: EdgeInsets.only(
              left:  MediaQuery.of(context).size.width * 0.035,
            ),
            child:  CardCategorySuggested(),
          ),
          Container(
            padding: EdgeInsets.only(
              left:  MediaQuery.of(context).size.width * 0.07,
            ),
            child:  HightlightResturantsWrapper()
          ),
          _optionsToContact(),
          _contactColumnPhones(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}