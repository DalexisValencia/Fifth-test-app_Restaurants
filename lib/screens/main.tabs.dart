import 'package:fith_app__restaurant/blocs/bloc/discovery/bloc/discovery_bloc.dart';
// import 'package:fith_app__restaurant/screens/disscover.dart';
import 'package:fith_app__restaurant/screens/home.dart';
import 'package:fith_app__restaurant/screens/restaurant.details.dart';
import 'package:fith_app__restaurant/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Widget _tabsController() {
    print('Verificar:::');
    print(tabStateInit);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          resizeToAvoidBottomPadding: false, //avoid flutter ugly alert
          backgroundColor: Theme.of(context).primaryColorLight,
          body: BlocProvider(
              create: (BuildContext context) => DiscoveryBloc(),
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: HomePage(
                        controller: _tabController, animateScreen: true),
                  ),
                  Container(
                    child: tabStateInit == 1 ? ScaffoldSearch() : SizedBox(),
                  ),
                  Container(
                    child: tabStateInit == 2
                        ? RestaurantDetailWrapper()
                        : SizedBox(),
                  ),
                  Container(
                    child: Center(
                      child: Text('En construcción'),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text('En construcción'),
                    ),
                  )
                ],
              )),
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

  Future<bool> _onWillPop() async {
    if (tabStateInit == 0) return true;
    _tabController.animateTo(_tabController.previousIndex);
    return false;
    // return (await showDialog(
    //       context: context,
    //       builder: (context) => new AlertDialog(
    //         title: new Text('Are you sure?'),
    //         content: new Text('Do you want to exit an App'),
    //         actions: <Widget>[
    //           new FlatButton(
    //             onPressed: () => Navigator.of(context).pop(false),
    //             child: new Text('No'),
    //           ),
    //           new FlatButton(
    //             onPressed: () => Navigator.of(context).pop(true),
    //             child: new Text('Yes'),
    //           ),
    //         ],
    //       ),
    //     )) ??
    //     false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: _tabsController(),
    );
  }
}
