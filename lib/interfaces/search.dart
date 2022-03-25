import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/interfaces/Restaurants.dart';

class SearchInitInterface {
  List<Dishes>? suggestions;
  List<Dishes>? popular;
  List<Restaurants>? highlightRestaurants;
  List<Dishes>? results;
  String? findIn;
  SearchInitInterface(
      {this.suggestions,
      this.popular,
      this.highlightRestaurants,
      this.results,
      this.findIn});
}
