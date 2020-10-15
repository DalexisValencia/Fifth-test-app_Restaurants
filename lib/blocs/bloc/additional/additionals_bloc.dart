import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';

part 'additionals_event.dart';
part 'additionals_state.dart';

class AdditionalsBloc extends Bloc<AdditionalsEvent, AdditionalsState> {
  AdditionalsBloc() : super(AdditionalsInitial(initial: []));

  @override
  Stream<AdditionalsState> mapEventToState(
    AdditionalsEvent event,
  ) async* {
    if (event is AdditionalsPopulate) {
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
      // yield AdditionalsCurrent(additionals: newsElement);
    }

    if (event is ToggleModifier) {
      //Lista de todos los adicionales
      List<Adittional> stateAditionals = state.props[0];
      //Adicional actual encontrado por el indice
      Adittional currentAddional = stateAditionals[event.parent];
      //Lista de los los valores del adicional
      List<AditionalsOptions> additionalOptions = currentAddional.children;
      //Buscamos el elemento dentro de la lista
      AditionalsOptions currentOption = additionalOptions[event.rid];
      // si el multiple colocamos todos es falso
      if (currentAddional.isMulti == false) {
        // print("aqui??");
        currentAddional.children.map((e) {
          if (e.name != currentOption.name) {
            e.isActive = false;
          }
        }).toList();
      }
      currentOption.isActive = !currentOption.isActive;
      // print(currentOption.isActive);

      List<Adittional> finalStateAditionals = List.from(stateAditionals);
      finalStateAditionals[event.parent].children
        ..removeAt(event.rid)
        ..insert(event.rid, currentOption);

      Adittional additionalFinal = Adittional(
          isMulti: finalStateAditionals[event.parent].isMulti,
          title: finalStateAditionals[event.parent].title,
          children: finalStateAditionals[event.parent].children);

      List<Adittional> finalAdditionals = List.from(stateAditionals)
        ..removeAt(event.parent)
        ..insert(event.parent, additionalFinal);
      print(finalAdditionals);
      yield AdditionalsCurrent(additionals: finalAdditionals);
    }
  }

  @override
  void onChange(Change<AdditionalsState> change) {
    super.onChange(change);
  }
}

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
