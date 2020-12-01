import 'package:fith_app__restaurant/Lists/menu.dart';
import 'package:fith_app__restaurant/screens/Search/components/Results/components/Results__seeAll.dart';
import 'package:fith_app__restaurant/screens/Search/components/Results/components/Results__title.dart';
import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:flutter/material.dart';

class ResultRecents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Recents",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              List<Widget> recent = [];
              recent.add(
                ResultsTitle(
                  total: '10',
                  showing: '3',
                ),
              );
              dishes.map((e) {
                recent.add(Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  // child: AsaCard(color: Colors.blue),
                  child: QuickView(dish: e),
                ));
              }).toList();
              recent.add(
                SeeAllRecents(
                  title: 'See all recents',
                  to: 'recente-search',
                ),
              );
              return Column(
                children: recent,
              );
            },
          )
        ],
      ),
    );
  }
}
