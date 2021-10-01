part of 'detailsrestaurant_bloc.dart';

abstract class DetailsrestaurantState extends Equatable {
  const DetailsrestaurantState();

  @override
  List<Object> get props => [];
}

class DetailsrestaurantInitial extends DetailsrestaurantState {}

class DetailsrestaurantCurrent extends DetailsrestaurantState {
  final Restaurants? restaurant;
  DetailsrestaurantCurrent({this.restaurant});

  @override
  List<Object> get props => [restaurant!];

  @override
  String toString() => 'DetailsrestaurantCurrent {props: $restaurant}';
}
