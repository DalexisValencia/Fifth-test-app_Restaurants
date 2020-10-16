part of 'dishamount_bloc.dart';

abstract class DishamountEvent extends Equatable {
  const DishamountEvent();

  @override
  List<Object> get props => [];
}

class DishInitialAmount extends DishamountEvent {
  final int amount;
  DishInitialAmount({this.amount});
}

class DishAmountPlus extends DishamountEvent {}

class DishAmountRemove extends DishamountEvent {}
