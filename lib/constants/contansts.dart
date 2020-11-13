import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const defaultPadding = 0.07;
const double borderRadiusImages = 12;
const double borderRadiusCards = 5;
const int animationStartTime = 50; // time in milliseconds
const int animationOpacityTime = 500; // time in milliseconds
const double defaultRadius = 15;
const double defaultHeaderCustomHeight = 50;
const primaryColor = Color(0xFF7F868A); // Gray
const defaultShadow =
    BoxShadow(blurRadius: 6, color: primaryColor, offset: Offset(0, 0)); //1
final formatter =
    NumberFormat.currency(locale: 'es_CO', name: 'COP', symbol: '');

String formatterPrice(price) {
  return formatter.format(price.toInt()).replaceAll(',00', '');
}

//Navegacion animada
customAnimateNavigation(BuildContext context, Widget blocinstance) {
  Navigator.of(context).push(PageRouteBuilder(
      //
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return blocinstance;
      },
      transitionsBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation, Widget child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInSine;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }));
}

// Navigator.of(context).push(
//     MaterialPageRoute<SeeMoreDishesByRestaurant>(
//         builder: (context) {
//   return BlocProvider.value(
//     value: restaurantBloc,
//     child: SeeMoreDishesByRestaurant(searchKey: 'lunchNow'),
//   );
// }));
