import 'package:restaurants/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:restaurants/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:restaurants/tabs/Bookings/bookings.dart';
import 'package:restaurants/tabs/Cart/Cart.dart';
import 'package:restaurants/tabs/Favorites/favorites.dart';
import 'package:restaurants/tabs/Home/home.dart';
import 'package:restaurants/tabs/TabsNavigation/tabs__bottomNavigationBar.dart';
import 'package:restaurants/tabs/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTabsWrapper extends StatefulWidget {
  @override
  _MainTabsWrapperState createState() => _MainTabsWrapperState();
}

class _MainTabsWrapperState extends State<MainTabsWrapper>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int tabStateInit = 0;
  late CartBloc cartBloc;
  late FavoritesBloc favoriteBloc;
  void goToTabs(int tab) {
    setState(() {
      tabStateInit = tab;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 5)
      ..addListener(() {
        setState(() {
          tabStateInit = _tabController.index;
        });
      });
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
    favoriteBloc = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _tabsController() {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          // resizeToAvoidBottomPadding: false, //avoid flutter ugly alert
          backgroundColor: Theme.of(context).primaryColorLight,
          body: MultiBlocProvider(
            providers: [
              BlocProvider<DiscoveryBloc>(
                create: (BuildContext context) => DiscoveryBloc(),
              ),
              BlocProvider<CartBloc>(
                create: (BuildContext context) => cartBloc,
              ),
              BlocProvider<FavoritesBloc>(
                create: (BuildContext context) => favoriteBloc,
              )
            ],
            child: BlocProvider.value(
              value: cartBloc,
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: HomePage(
                      controller: _tabController,
                      animateScreen: true,
                    ),
                  ),
                  Container(
                    child: tabStateInit == 1
                        ? BlocProvider(
                            create: (BuildContext context) => SearchBloc()
                              ..add(
                                SearchInit(findIn: 'all'),
                              ),
                            child: ScaffoldSearch(
                              from: 'tabs',
                              controller: _tabController,
                            ),
                          )
                        : SizedBox(),
                  ),
                  Container(
                    child: tabStateInit == 2 ? BookingsScreen() : SizedBox(),
                  ),
                  Container(
                    child: tabStateInit == 3 ? FavoritesScreen() : SizedBox(),
                  ),
                  Container(
                    child: tabStateInit == 4 ? ScreenCart() : SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: TabsBottomNavigationBar(
            controller: _tabController,
            changeTabs: goToTabs,
          )),
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
