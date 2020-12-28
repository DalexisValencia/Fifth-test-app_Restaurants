import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/discovery/bloc/discovery_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/tabs/Bookings/bookings.dart';
import 'package:fith_app__restaurant/tabs/Cart/Cart.dart';
import 'package:fith_app__restaurant/tabs/Favorites/favorites.dart';
import 'package:fith_app__restaurant/tabs/Home/home.dart';
import 'package:fith_app__restaurant/tabs/Search/search.dart';
import 'package:fith_app__restaurant/widgets/Animation__amountOnGlobe.dart';
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
  // ignore: close_sinks
  CartBloc cartBloc;
  // ignore: close_sinks
  FavoritesBloc favoriteBloc;
  void goToTabs(int tab) {
    setState(() {
      tabStateInit = tab;
    });
  }

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 5)
      ..addListener(() {
        //print("ha cambiado!!!");
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
        resizeToAvoidBottomPadding: false, //avoid flutter ugly alert
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
                          child: ScaffoldSearch(),
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
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 60,
          child: TabBar(
            controller: _tabController,
            labelPadding: EdgeInsets.only(right: 5),
            labelColor: Theme.of(context).primaryColorDark,
            unselectedLabelColor: Theme.of(context).accentColor,
            indicatorColor: Color(0X000000),
            onTap: (tab) {
              goToTabs(tab);
            },
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
                ),
              ),
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
                ),
              ),
              Tab(
                  iconMargin: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.class_,
                    size: 20,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Bookings",
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
                ),
              ),
              Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 20,
                        ),
                        Text(
                          "Car",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 16,
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (BuildContext context, CartState state) {
                        List<Dishes> inCart = state.props[0];
                        return inCart.length == 0
                            ? SizedBox()
                            : Container(
                                width: 16,
                                height: 16,
                                child: AnimationAmountGlobeCart(
                                  amout: inCart.length,
                                ),
                              );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
