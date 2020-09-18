part of 'dish_bloc.dart';

abstract class DishState extends Equatable {
  const DishState();

  @override
  List<Object> get props => [];
}

class DishInitial extends DishState {}

class DishCurrent extends DishState {
  final Iterable<Dishes> dish;
  DishCurrent({this.dish});

  @override
  List<Object> get props => [dish];

  @override
  String toString() => 'DishCurrent {Search by: $dish}';
}
