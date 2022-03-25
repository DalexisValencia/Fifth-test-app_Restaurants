import 'package:flutter/material.dart';
import 'package:restaurants/tabs/TabsNavigation/tabs__bottomNavigationBar--item.dart';
import 'package:restaurants/tabs/TabsNavigation/tabs__bottomNavigationBar--item__card.dart';

class TabsBottomNavigationBar extends StatelessWidget {
  final TabController? controller;
  final Function? changeTabs;
  const TabsBottomNavigationBar({
    Key? key,
    this.controller,
    this.changeTabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: TabBar(
        controller: controller,
        labelPadding: EdgeInsets.only(right: 5),
        labelColor: Theme.of(context).primaryColorDark,
        unselectedLabelColor: Theme.of(context).accentColor,
        indicatorColor: Color(0X000000),
        onTap: (tab) {
          changeTabs!(tab);
          // goToTabs(tab);
        },
        tabs: [
          TabsBottomNavItem(
            title: "Home",
            icon: Icons.home,
          ),
          TabsBottomNavItem(
            title: "Delicious",
            icon: Icons.restaurant,
          ),
          TabsBottomNavItem(
            title: "Bookings",
            icon: Icons.class_,
          ),
          TabsBottomNavItem(
            title: "Favs",
            icon: Icons.favorite,
          ),
          TabsBottomNavItemCar(),
        ],
      ),
    );
  }
}
