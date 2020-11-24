part of 'dish_bloc.dart';

abstract class DishEvent extends Equatable {
  const DishEvent();

  @override
  List<Object> get props => [];
}

class DishStart extends DishEvent {
  final Dishes currentDish;
  DishStart({this.currentDish});
}

class DishModifierEdit extends DishEvent {
  final AditionalsOptions currentModifier;
  DishModifierEdit({this.currentModifier});
}

class DishClean extends DishEvent {}
