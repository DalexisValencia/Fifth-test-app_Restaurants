import 'package:restaurants/widgets/Screen__heading.dart';
import 'package:flutter/material.dart';

class RestaurantdetailFeatures extends StatelessWidget {
  final String? title, subtitle;
  RestaurantdetailFeatures({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.03,
      ),
      width: MediaQuery.of(context).size.width,
      child: ScreenHeading(
        title: title!,
        subtitle: subtitle!,
      ),
    );
  }
}
