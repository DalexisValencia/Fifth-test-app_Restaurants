import 'package:flutter/material.dart';

class SharedCircle extends StatefulWidget {
  final String? title;
  final IconData? icon;
  SharedCircle({
    this.title,
    this.icon,
  });
  @override
  _SharedCircleState createState() => _SharedCircleState();
}

class _SharedCircleState extends State<SharedCircle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
          child: MaterialButton(
            //this wwas a RaisedButton
            elevation: 0,
            color: Theme.of(context).accentColor.withOpacity(0.5),
            onPressed: () {},
            padding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.20,
              ),
            ),
            child: Icon(
              widget.icon,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.01,
          ),
          // color: Colors.blue,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.title!,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 12,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
