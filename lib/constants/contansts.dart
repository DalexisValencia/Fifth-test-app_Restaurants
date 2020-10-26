import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const defaultPadding = 0.07;
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
