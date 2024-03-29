import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//\$

//UI Colors
const primaryColor = Color(0xFF7F868A); // GREY
const secondaryColor = Color(0xFFFBFBFB); // WHITE
const tertiaryColor = Color(0xFF686778); // DARK BLUE
const fourthColor = Color(0xFFE76D6F); // PINK
const fifthColor = Color(0xFFC2C2C2); // LIGHT GREY
const sixthColor = Color(0xFFEFEFEF); // WHITE LITTLE DARK
const seventhColor = Color(0xFFFFB60E); // YELLOW
const eightColor = Color(0xFF4F57D5); // PURPLE
const ninethColor = Color(0xFFEFEEF2); // LIGHT PURPLE
//
const Color cardSelectedBgColor = Color(0xFFffe8e9);
const defaultPadding = 0.07;
const double borderRadiusImages = 12;
const double spaceUntilBottom = 20;
const double borderRadiusCards = 5;
const double borderWidthSelected = 1; // Ancho de borde tarjeta seleccionada
const double borderWidhNoSelected = 0.5; // Ancho de borde tarjeta normal
const int animationStartTime = 50; // time in milliseconds
const int animationOpacityTime = 500; // time in milliseconds
const double defaultRadius = 15;
const double defaultHeaderCustomHeight = 50;

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

snackBarAddCart(BuildContext context, name) {
  final snackBarCar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Theme.of(context).primaryColorDark,
    content: RichText(
      text: TextSpan(
        text: name,
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Se ha añadido al carrito',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBarCar);
}

// Split the First letter of the name and lastName to create a two Letters pseudonimo  like DV
splitName(String name) {
  String firtsLetter = name.split(' ')[0].substring(0, 1).toUpperCase();
  String secondLetter = name.split(' ')[1].substring(0, 1).toUpperCase();
  return firtsLetter + secondLetter;
}
