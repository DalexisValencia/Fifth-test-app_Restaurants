import 'package:fith_app__restaurant/interfaces/availableForLunch.dart';
import 'package:fith_app__restaurant/sections/CardAvailableForLunch.dart';
import 'package:flutter/material.dart';

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
            DetailHighlightProduct()
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
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.52,
            // child: CompleteListAvailablePlates(),
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 2/2,
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