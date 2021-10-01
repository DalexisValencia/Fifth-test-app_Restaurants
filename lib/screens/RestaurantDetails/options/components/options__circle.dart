import 'package:flutter/material.dart';

class CircleOption extends StatefulWidget {
  final String? title;
  final IconData? icon;
  CircleOption({
    this.title,
    this.icon,
  });
  @override
  _CircleOptionState createState() => _CircleOptionState();
}

class _CircleOptionState extends State<CircleOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
          child: RaisedButton(
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
