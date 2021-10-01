import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';

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
