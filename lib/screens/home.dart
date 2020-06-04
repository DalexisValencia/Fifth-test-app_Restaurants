import 'package:flutter/material.dart';

class HomePageScafold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.amber
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.blue,
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
                        fillColor: Color(0x00000000),
                        splashColor: Colors.blue,
                        child: Icon(Icons.arrow_back, color: Colors.white,size: 30),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: (){},
                        elevation: 2.0,
                        fillColor:  Theme.of(context).primaryColorLight.withOpacity(0.4),
                        child: Icon(Icons.linked_camera, color: Colors.white,),
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
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.amber,
                          child: Text(
                            "HAVE A GOOD DAY",
                            style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:5),
                          color: Colors.amberAccent,
                          child: Text(
                            'Restaurants waiting for you',
                            style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.normal
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
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
        ]
      ),
    );
  }
}