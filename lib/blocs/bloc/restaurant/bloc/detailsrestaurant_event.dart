part of 'detailsrestaurant_bloc.dart';

abstract class DetailsrestaurantEvent extends Equatable {
  const DetailsrestaurantEvent();

  @override
  List<Object> get props => [];
}

class DetailsresturantSetCurrent extends DetailsrestaurantEvent {
  final Restaurants restaurant;
  DetailsresturantSetCurrent({this.restaurant});
}
