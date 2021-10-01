part of 'additionals_bloc.dart';

abstract class AdditionalsEvent extends Equatable {
  const AdditionalsEvent();

  @override
  List<Object> get props => [];
}

class AdditionalsStart extends AdditionalsEvent {
  final List<Adittional>? initial;
  AdditionalsStart({
    this.initial,
  });
}

class AdditionalsPopulate extends AdditionalsEvent {
  // final List<Adittional> additionals;
  final List<Adittional>? additionals;
  AdditionalsPopulate({
    this.additionals,
  });
}

class UpdateAditionalState extends AdditionalsEvent {
  final String? additional;
  final int? rid;
  UpdateAditionalState({
    this.additional,
    this.rid,
  });
}

class ToggleModifier extends AdditionalsEvent {
  final int? parent;
  final AditionalsOptions? item;
  final int? rid;
  ToggleModifier({
    this.parent,
    this.item,
    this.rid,
  });
}
