import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';

part 'additionals_event.dart';
part 'additionals_state.dart';

List<String> unapruebaTonta = [
  'Uno',
  'Dos',
  'Tres',
  'Cuatro',
  'Cinco',
  'Seis',
  'Siete',
  'Ocho',
  'Nueve',
  'Diez'
];

class AdditionalsBloc extends Bloc<AdditionalsEvent, AdditionalsState> {
  AdditionalsBloc() : super(AdditionalsInitial(initial: []));

  //final DishBloc dishBloc;
  //StreamSubscription subscription;

  @override
  Stream<AdditionalsState> mapEventToState(
    AdditionalsEvent event,
  ) async* {
    if (event is AdditionalsPopulate) {
      print('event.additionals');
      print(event.additionals);
      yield AdditionalsCurrent(additionals: event.additionals);
    }

    if (event is AdditionalsStart) {
      yield AdditionalsInitial(initial: []);
    }

    if (event is UpdateAditionalState) {
      List<String> elementos = state.props[0];
      List<String> newsElement = List.from(elementos)
        ..removeAt(event.rid)
        ..insert(event.rid, elementos[event.rid] == "true" ? "false" : "true");
      // elementos..removeAt(event.rid);
      // elementos..insert(event.rid, "Cambiado");
      // print(event.additional);
      // print(event.rid);
      // elementos[event.rid] = "Cambiado";

      // print(elementos);
      // yield AdditionalsCurrent(
      //     additionals: List.from(elementos)..add(generateRandomString(6)));
      yield AdditionalsCurrent(additionals: newsElement);
    }
  }

  Stream<AdditionalsState> _mapTodoAddedToState(
      UpdateAditionalState event) async* {
    if (state is AdditionalsCurrent) {
      List<String> elementos = state.props[0];
      elementos.add(generateRandomString(6));
      yield AdditionalsCurrent(additionals: elementos);
    }
  }

  @override
  void onChange(Change<AdditionalsState> change) {
    print(change);
    super.onChange(change);
  }
}

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
