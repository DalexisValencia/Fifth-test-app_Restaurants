part of 'additionals_bloc.dart';

abstract class AdditionalsEvent extends Equatable {
  const AdditionalsEvent();

  @override
  List<Object> get props => [];
}

class AdditionalsStart extends AdditionalsEvent {
  final List<String> initial;
  AdditionalsStart({this.initial});
}

class AdditionalsPopulate extends AdditionalsEvent {
  // final List<Adittional> additionals;
  final List<String> additionals;
  AdditionalsPopulate({this.additionals});
}

class UpdateAditionalState extends AdditionalsEvent {
  final String additional;
  final int rid;
  UpdateAditionalState({this.additional, this.rid});
}
