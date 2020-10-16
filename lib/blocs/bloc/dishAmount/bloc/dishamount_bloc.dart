import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dishamount_event.dart';
part 'dishamount_state.dart';

class DishamountBloc extends Bloc<DishamountEvent, DishamountState> {
  DishamountBloc() : super(DishamountInitial(amount: 1));

  @override
  Stream<DishamountState> mapEventToState(
    DishamountEvent event,
  ) async* {
    if (event is DishInitialAmount) {
      yield DishamountCurrent(amount: event.amount);
    }
    if (event is DishAmountPlus) {
      int _state = state.props[0];
      yield DishamountCurrent(amount: _state + 1);
    }
    if (event is DishAmountRemove) {
      int _state = state.props[0];
      yield DishamountCurrent(amount: _state - 1);
    }
  }
}
