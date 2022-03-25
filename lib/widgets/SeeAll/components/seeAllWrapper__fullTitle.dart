import 'package:flutter/material.dart';

class FullSectionTitle extends StatefulWidget {
  final String? title;
  final Widget? rightContainer;
  final bool? paddingRight;
  FullSectionTitle({
    this.title,
    this.rightContainer,
    this.paddingRight,
  });
  @override
  _FullSectionTitleState createState() => _FullSectionTitleState();
}

class _FullSectionTitleState extends State<FullSectionTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
          widget.rightContainer!
        ],
      ),
    );
  }
}
