import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';

part 'additionals_event.dart';
part 'additionals_state.dart';

class AdditionalsBloc extends Bloc<AdditionalsEvent, AdditionalsState> {
  AdditionalsBloc() : super(AdditionalsInitial(initial: [], prices: 0));

  @override
  Stream<AdditionalsState> mapEventToState(
    AdditionalsEvent event,
  ) async* {
    if (event is AdditionalsPopulate) {
      yield AdditionalsCurrent(additionals: event.additionals!, prices: 0);
    }

    if (event is AdditionalsStart) {
      yield AdditionalsInitial(initial: [], prices: 0);
    }

    if (event is UpdateAditionalState) {
      // List<String> elementos = state.props[0];
      // List<String> newsElement = List.from(elementos)
      //   ..removeAt(event.rid)
      //   ..insert(event.rid, elementos[event.rid] == "true" ? "false" : "true");
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
      List<Adittional> stateAditionals = state.props[0] as List<Adittional>;
      //Adicional actual encontrado por el indice
      Adittional currentAddional = stateAditionals[event.parent!];
      //Lista de los los valores del adicional
      List<AditionalsOptions> additionalOptions = currentAddional.children!;
      //Buscamos el elemento dentro de la lista
      AditionalsOptions currentOption = additionalOptions[event.rid!];
      // si no es multiple colocamos todos es falso
      if (currentAddional.isMulti == false) {
        currentAddional.children?.map((e) {
          if (e.name != currentOption.name) {
            e.isActive = false;
          }
        }).toList();
      }
      currentOption.isActive = !currentOption.isActive!;

      List<Adittional> finalStateAditionals = List.from(stateAditionals);
      finalStateAditionals[event.parent!].children!
        ..removeAt(event.rid!)
        ..insert(event.rid!, currentOption);

      Adittional additionalFinal = Adittional(
          isMulti: finalStateAditionals[event.parent!].isMulti,
          title: finalStateAditionals[event.parent!].title,
          children: finalStateAditionals[event.parent!].children);

      List<Adittional> finalAdditionals = List.from(stateAditionals)
        ..removeAt(event.parent!)
        ..insert(event.parent!, additionalFinal);
      yield AdditionalsCurrent(
          additionals: finalAdditionals,
          prices: _getAdditionalPrices(finalAdditionals));
    }
  }

  @override
  void onChange(Change<AdditionalsState> change) {
    super.onChange(change);
  }
}

int _getAdditionalPrices(additionals) {
  int price = 0;
  List<Adittional> additional = additionals;
  additional.forEach((element) {
    element.children!.forEach((additinalEl) {
      if (additinalEl.isActive!) {
        if (additinalEl.price != 0) {
          price += additinalEl.price!;
        }
      }
    });
  });

  return price;
}
