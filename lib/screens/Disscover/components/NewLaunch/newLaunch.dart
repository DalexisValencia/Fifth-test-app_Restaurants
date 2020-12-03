import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/Disscover/components/NewLaunch/components/newLauch__card.dart';
import 'package:fith_app__restaurant/widgets/Screen__seeAllSection.dart';
import 'package:flutter/material.dart';

class NewLaunch extends StatefulWidget {
  final List<Dishes> newLaunched;
  NewLaunch({
    this.newLaunched,
  });
  @override
  _NewLaunchState createState() => _NewLaunchState();
}

class _NewLaunchState extends State<NewLaunch> {
  Widget _verticalList() {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> _totalLaunched = [];
          widget.newLaunched.asMap().entries
            ..map((e) {
              _totalLaunched.add(
                NewLaunchedCard(
                  dish: widget.newLaunched[e.key],
                ),
              );
            }).toList();
          return Column(
            children: _totalLaunched,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SeeAllSuggested(
            title: "New Launch",
          ),
          _verticalList(),
        ],
      ),
    );
  }
}
