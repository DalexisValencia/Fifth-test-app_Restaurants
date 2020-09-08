import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';

class Discovery {
  final String name;
  final List<Dishes> popular; // it is also calling
  final List<Dishes> newLaunch;
  final List<Restaurants> restaurants;
  Discovery({this.name, this.popular, this.newLaunch, this.restaurants});
}
