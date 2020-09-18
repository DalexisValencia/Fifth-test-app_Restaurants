part of 'dish_bloc.dart';

abstract class DishEvent extends Equatable {
  const DishEvent();

  @override
  List<Object> get props => [];
}

class DishStart extends DishEvent {
  final String dishName;
  DishStart({this.dishName});
}
