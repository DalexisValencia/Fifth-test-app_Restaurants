import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:fith_app__restaurant/widgets/quickViewCard.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _seeAll(title, to) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Align(
        child: MaterialButton(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.transparent,
          splashColor: Theme.of(context).splashColor,
          onPressed: () {},
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).primaryColorDark),
          ),
        ),
      ),
    );
  }

  Widget _totalregisters(registers) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 5),
      child: Align(
          alignment: Alignment.topRight,
          child: Text(registers,
              style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.w400))),
    );
  }

  Widget _recentSearch() {
    var recentsSearchs = [1, 2, 3];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Recientes",
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
              recent.add(_totalregisters('Recents 3 of 20'));
              recentsSearchs.map((e) {
                recent.add(Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text("busquedas recientes"),
                  // child: QuickView(),
                ));
              }).toList();
              recent.add(_seeAll('See all recents', 'recente-search'));
              return Column(
                children: recent,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _results() {
    var recentsSearchs = [1, 2, 3];
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Results",
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
              recent.add(_totalregisters('Results 3 of 40'));
              recentsSearchs.map((e) {
                recent.add(Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: Text("resultads"),
                  // child: QuickView(),
                ));
              }).toList();
              recent.add(_seeAll('See all results', 'recente-search'));
              return Column(
                children: recent,
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double withDefaultPadding = totalWidth * defaultPadding;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: withDefaultPadding),
      height: MediaQuery.of(context).viewInsets.bottom > 1
          ? MediaQuery.of(context).viewInsets.bottom
          : MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          _recentSearch(),
          _results(),
          // _recentSearch(),
          SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}
