import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/Restaurants.dart';

class SearchInitInterface {
  List<Dishes> suggestions;
  List<Dishes> popular;
  List<Restaurants> highlightRestaurants;
  SearchInitInterface(
      {this.suggestions, this.popular, this.highlightRestaurants});
}
