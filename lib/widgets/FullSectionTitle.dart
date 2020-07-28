//import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
// import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:flutter/material.dart';
class FullSectionTitle extends StatefulWidget {
  final String title;
  final Widget rightContainer;
  final bool paddingRight;
  FullSectionTitle({this.title, this.rightContainer, this.paddingRight});
  @override
  _FullSectionTitleState createState() => _FullSectionTitleState();
}

class _FullSectionTitleState extends State<FullSectionTitle> {
  @override
  Widget build(BuildContext context) {
    // double withDefaultPadding = MediaQuery.of(context).size.width * defaultPadding; 
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: widget.paddingRight ? EdgeInsets.symmetric(
      //     horizontal: withDefaultPadding) : 
      //     EdgeInsets.only(
      //       left: withDefaultPadding
      //     ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
           widget.title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w800),
          ),
          widget.rightContainer
          // CircleIconButton(
          //   icon: Icons.tune,
          //   color: Theme.of(context).primaryColorDark,
          //   bgColor: Theme.of(context).primaryColorLight,
          //   trigger: () {
          //   },
          // ),
        ],
      ),
    );
  }
}