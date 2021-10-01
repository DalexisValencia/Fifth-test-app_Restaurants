import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';

class Discovery {
  final String? name;
  final List<Dishes>? near;
  final List<Dishes>? newLaunch;
  final List<Restaurants>? restaurants;
  Discovery({
    this.name,
    this.near,
    this.newLaunch,
    this.restaurants,
  });
}
