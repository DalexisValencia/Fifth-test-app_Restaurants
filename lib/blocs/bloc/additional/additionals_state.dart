part of 'additionals_bloc.dart';

abstract class AdditionalsState extends Equatable {
  const AdditionalsState();

  @override
  List<Object> get props => [];
}

class AdditionalsInitial extends AdditionalsState {
  final List<Adittional>? initial;
  final int? prices;
  AdditionalsInitial({this.initial, this.prices});

  @override
  List<Object> get props => [initial!, prices!];

  @override
  String toString() => 'AdditionalsCurrent {Search by: $initial, $prices}';
}

class AdditionalsCurrent extends AdditionalsState {
  final List<Adittional>? additionals;
  final int? prices;
  AdditionalsCurrent({this.additionals, this.prices});

  @override
  List<Object> get props => [additionals!, prices!];

  @override
  String toString() => 'AdditionalsCurrent {Search by: $additionals, $prices}';
}
