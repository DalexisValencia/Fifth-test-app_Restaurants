import 'package:restaurants/Lists/menu.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/tabs/Home/components/Suggested__card.dart';
import 'package:flutter/material.dart';

class HomeCategoriesSuggested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double withDefaultPadding =
        MediaQuery.of(context).size.width * defaultPadding;
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.025,
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        left: withDefaultPadding,
        right: withDefaultPadding,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Builder(builder: (BuildContext context) {
        List<Widget> _categoriesCard = [];
        categories.asMap().entries.map((item) {
          _categoriesCard.add(
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, -3),
                    color: Theme.of(context).accentColor.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(7),
              ),
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.30 / 2,
              child: SuggestedCard(
                category: item.value,
                // controller: widget.controller,
              ),
            ),
          );
        }).toList();
        return Wrap(
          spacing: MediaQuery.of(context).size.height * 0.02,
          runSpacing: MediaQuery.of(context).size.height * 0.02,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: _categoriesCard,
        );
      }),
    );
  }
}
