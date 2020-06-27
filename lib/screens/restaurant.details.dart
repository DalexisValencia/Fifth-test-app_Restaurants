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
        // child:  Icon(Icons.comment)
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

  List availablePlates = ['1', '2', '3'];
  
  Widget _wrapperHeader () => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text('Avilable Now'),
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
        left: MediaQuery.of(context).size.width * 0.07
      ),
      child: Column(
        children: <Widget>[
          _wrapperHeader(),
          Container(
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.50,
            child: CompleteListAvailablePlates(),
          ),
          SizedBox(
            height: 20,
          )
          // _completeListAvailablePlates(),
        ],
      ),
    );
  }
}

class CompleteListAvailablePlates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(
            right:MediaQuery.of(context).size.width * 0.04
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal,
          ),
          width: MediaQuery.of(context).size.width * 0.70,
          //child: Card(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      ),
                      color: Colors.yellow,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top:  MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.05,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.05,
                              MediaQuery.of(context).size.height * 0.01,
                              MediaQuery.of(context).size.width * 0.05,
                              MediaQuery.of(context).size.height * 0.01
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text(
                              'eliminatioru',
                              style: Theme.of(context).textTheme.button.copyWith(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 12
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ),
                      color: Colors.amberAccent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.watch),
                            Text('12000 - 10000')
                          ],
                        ),
                        Text('House of ilumin san diego'),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.star),Icon(Icons.star),Icon(Icons.star),
                                Icon(Icons.star),Icon(Icons.star)
                              ],
                            ),
                            Text('4.8 aqiulfier')
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.watch),
                            Text('the preparation time')
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * 0.02
                                ),
                                child: Chip(
                                  label: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text('1 - 12.000') 
                                  )
                                ),
                              )
                            ),
                             Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * 0.02
                                ),
                                child: Chip(
                                  label: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text('1 - 12.000') 
                                  )
                                ),
                              )
                            ),
                             Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * 0.02
                                ),
                                child: Chip(
                                  label: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text('1 - 12.000') 
                                  )
                                ),
                              )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          //),
        );
      },
    );
  }
}