import 'package:fith_app__restaurant/screens/disscover.dart';
import 'package:fith_app__restaurant/screens/home.dart';
import 'package:fith_app__restaurant/screens/plate.detail.dart';
import 'package:fith_app__restaurant/screens/restaurant.details.dart';
import 'package:fith_app__restaurant/screens/search.dart';
import 'package:flutter/material.dart';

class MainTabsWrapper extends StatefulWidget {
  @override
  _MainTabsWrapperState createState() => _MainTabsWrapperState();
}

class _MainTabsWrapperState extends State<MainTabsWrapper>
    with TickerProviderStateMixin {
  TabController _tabController;
  int tabStateInit = 0;
  void goToTabs(int tab) {
    setState(() {
      tabStateInit = tab;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          resizeToAvoidBottomPadding: false, //avoid flutter ugly alert
          backgroundColor: Theme.of(context).primaryColorLight,
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                child:
                    HomePage(controller: _tabController, animateScreen: true),
              ),
              Container(
                child: ScaffoldSearch(),
              ),
              Container(
                child: RestaurantDetailWrapper(),
              ),
              Container(
                child: PlateDetailWrapper(),
              ),
              Container(
                child: DiscoverScaffold(),
              )
            ],
          ),
          bottomNavigationBar: Container(
              color: Colors.white,
              height: 60,
              child: TabBar(
                  controller: _tabController,
                  labelPadding: EdgeInsets.only(right: 5),
                  labelColor: Theme.of(context).primaryColorDark,
                  unselectedLabelColor: Theme.of(context).accentColor,
                  indicatorColor: Color(0X000000),
                  onTap: (tab) => goToTabs(tab),
                  tabs: [
                    Tab(
                        iconMargin: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.home,
                          size: 20,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Home",
                            style: TextStyle(fontSize: 12),
                          ),
                        )),
                    Tab(
                        iconMargin: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.restaurant,
                          size: 20,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Delicious",
                            style: TextStyle(fontSize: 12),
                          ),
                        )),
                    Tab(
                        iconMargin: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.class_,
                          size: 20,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Bookmark",
                            style: TextStyle(fontSize: 12),
                          ),
                        )),
                    Tab(
                        iconMargin: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.favorite,
                          size: 20,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Favs",
                            style: TextStyle(fontSize: 12),
                          ),
                        )),
                    Tab(
                        iconMargin: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 20,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Car",
                            style: TextStyle(fontSize: 12),
                          ),
                        )),
                  ]))),
    );
  }
}
