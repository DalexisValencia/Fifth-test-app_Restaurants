import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/widgets/Cardcomments.dart';
import 'package:fith_app__restaurant/widgets/iconAndText.dart';
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
              fit: BoxFit.cover, image: ExactAssetImage(widget.dish.image))),
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
                        widget.dish.name,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.dish.details.substring(0, 28) + '...',
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
          IconAndText(
            icon: Icons.star,
            iconColor: Theme.of(context).buttonColor,
            iconSize: 13,
            text: '4.8 votes',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 11,
          ),
          IconAndText(
            icon: Icons.timer,
            iconColor: Theme.of(context).primaryColorDark,
            iconSize: 13,
            text: '30 minutes',
            textColor: Theme.of(context).primaryColorDark,
            textSize: 11,
          ),
          InkWell(
            onTap: () {},
            child: IconAndText(
              icon: Icons.assignment,
              iconColor: Theme.of(context).primaryColorDark,
              iconSize: 13,
              text: 'Reserve',
              textColor: Theme.of(context).primaryColorDark,
              textSize: 11,
            ),
          )
        ],
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
          children: <Widget>[
            _cardHeader(), _cardBody(),
            //
            CardComments(
              comments: widget.dish.comments,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.dish.comments.length > 2
            ? 315
            : 185 + (widget.dish.comments.length * 50).toDouble(),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07),
        width: MediaQuery.of(context).size.width,
        // child: Material(
        child: InkWell(
          //splashColor: Colors.red,
          onTap: () {},
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
        )
        // )
        );
  }
}
