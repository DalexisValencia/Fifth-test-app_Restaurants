import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/FullSectionTitle.dart';
import 'package:fith_app__restaurant/widgets/RadiusButton.dart';
import 'package:flutter/material.dart';

class ExploreTheMenu extends StatefulWidget {
  final List<String> tags;
  ExploreTheMenu({this.tags});
  @override
  _ExploreTheMenuState createState() => _ExploreTheMenuState();
}

class _ExploreTheMenuState extends State<ExploreTheMenu> {
  Widget _header() => Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * defaultPadding),
      child: FullSectionTitle(
        title: 'Explore the Menu',
        rightContainer:
            RoundedCustomButton(title: 'See all', callPressed: () {}),
      ));

  Widget _chipsAsMenu() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * defaultPadding),
        child: Builder(builder: (BuildContext context) {
          List<Widget> chips = [];
          widget.tags.map((e) {
            chips.add(Container(
                child: Chip(
                    label: Text(
              '$e',
              maxLines: 1,
            ))));
          }).toList();
          return Wrap(
            runSpacing: -8,
            spacing: 5,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: chips,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _header(),
          _chipsAsMenu(),
        ],
      ),
    );
  }
}
