import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:flutter/material.dart';

class NewLaunchedWrapper extends StatefulWidget {
  final Dishes dish;
  NewLaunchedWrapper({this.dish});
  @override
  _NewLaunchedWrapperState createState() => _NewLaunchedWrapperState();
}

class _NewLaunchedWrapperState extends State<NewLaunchedWrapper> {
  Widget _wrapperImage() {
    return Container(
      height: 240,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/banner/french-food.png'))),
    );
  }

  Widget _cardHeader() {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  width: 0.6))),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.010),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'House of Blues san diego',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'address direction or description',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.restaurant_menu,
                size: 20,
                color: Theme.of(context).primaryColorLight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cardBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Theme.of(context).primaryColor.withOpacity(0.6),
                  width: 0.6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _iconAnText(Icons.star, Theme.of(context).buttonColor, '4.8 votes'),
          _iconAnText(
              Icons.timer, Theme.of(context).primaryColorDark, '30 minutes'),
          _iconAnText(Icons.format_align_right,
              Theme.of(context).primaryColorDark, 'Agenda')
        ],
      ),
    );
  }

  Widget _cardComments() {
    List comments = [1, 2];
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> wComments = [];
          comments.asMap().entries.map((e) {
            int idx = e.key;
            wComments.add(Container(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  border: Border(
                      bottom: BorderSide(
                          color: (idx + 1) == comments.length
                              ? Colors.transparent
                              : Theme.of(context).primaryColor.withOpacity(0.6),
                          width: 0.6))),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 47,
                      height: 47,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Nombre del usuario',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.bold),
                          ),
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Comentario que ha colocado el ususario',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
          }).toList();
          return Column(
            children: wComments,
          );
        },
      ),
    );
  }

  Widget _cardWrapper() {
    return Container(
      transform: Matrix4.translationValues(0, -100, 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.5),
                  offset: Offset(0, 0))
            ],
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width * 0.72,
        child: Column(
          children: <Widget>[_cardHeader(), _cardBody(), _cardComments()],
        ),
      ),
    );
  }

  Widget _iconAnText(icon, color, text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 14,
          color: color,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.button.copyWith(
              fontSize: 13,
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          _wrapperImage(),
          Positioned(
            top: 200,
            left: MediaQuery.of(context).size.width * 0.07,
            child: _cardWrapper(),
          )
        ],
      ),
    );
  }
}
