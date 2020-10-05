part of 'additionals_bloc.dart';

abstract class AdditionalsState extends Equatable {
  const AdditionalsState();

  @override
  List<Object> get props => [];
}

class AdditionalsInitial extends AdditionalsState {
  final List<String> initial;
  AdditionalsInitial({this.initial});

  @override
  List<Object> get props => [initial];

  @override
  String toString() => 'AdditionalsCurrent {Search by: $initial}';
}

class AdditionalsCurrent extends AdditionalsState {
  final List<String> additionals;
  AdditionalsCurrent({this.additionals});

  @override
  List<Object> get props => [additionals];

  @override
  String toString() => 'AdditionalsCurrent {Search by: $additionals}';
}

class AdditionalsUpdated extends AdditionalsState {
  // final List<Adittional> additionals;
  final List<String> additionals;
  AdditionalsUpdated({this.additionals});

  @override
  List<Object> get props => [additionals];

  @override
  String toString() => 'AdditionalsUpdated {Search by: $additionals}';
}

class UpdateAdditional extends AdditionalsState {
  // final Adittional additional;
  final String additional;

  UpdateAdditional({this.additional});
}
