import 'package:restaurants/blocs/bloc/search/bloc/search_bloc.dart';
import 'package:restaurants/interfaces/search.dart';
import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixedTopHeader extends StatefulWidget {
  final String? from;
  final TabController? controller;
  FixedTopHeader({
    Key? key,
    this.from,
    this.controller,
  }) : super(key: key);
  @override
  FixedTopHeaderState createState() => FixedTopHeaderState();
}

class FixedTopHeaderState extends State<FixedTopHeader> {
  FocusNode _focus = new FocusNode();
  final TextEditingController searcController = new TextEditingController();
  late SearchBloc searchBloc;
  @override
  void initState() {
    super.initState();
    //_focus.hasFocus
    // _focus.addListener(widget.onfocusSearch);
    searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  void clickInIconTextFormField(resulst) {
    // si no hay nada en el campo de busqueda
    if (searcController.value.text == '') {
      _focus.requestFocus();
    }
    // si existe algo en el campo de busqueda independiente de si tiene resultados o no
    else if (searcController.value.text != '') {
      //si hay resultados limpiamos
      if (resulst.results.length >= 1) {
        searchBloc.add(
          ClearSearch(),
        );
      }
      FocusScope.of(context).unfocus();
      searcController.clear();
    }
  }

  OutlineInputBorder defaulBorderInput() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      borderSide: new BorderSide(
        color: Theme.of(context).cardColor,
        width: 0,
      ),
    );
  }

  Widget _iconTextFormField() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        SearchInitInterface modelSearch = state.props[0] as SearchInitInterface;
        return GestureDetector(
          child: Container(
            width: 40,
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: MaterialButton(
              // this was a RaisedButton
              animationDuration: Duration(
                milliseconds: 10,
              ),
              padding: EdgeInsets.all(0),
              elevation: 0,
              color: Colors.transparent,
              splashColor: Theme.of(context).buttonColor,
              child: Icon(
                modelSearch.results!.length >= 1 && searcController.text != ''
                    ? Icons.close
                    : Icons.search,
                size: 16,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              onPressed: () {},
              onHighlightChanged: (val) {
                //Se ejecuta cuando se deja de presionar el boton
                if (val == false) {
                  clickInIconTextFormField(modelSearch);
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _inputSearch() {
    return Expanded(
      flex: 1,
      child: Material(
        child: Form(
          child: Container(
            child: TextFormField(
              onChanged: (val) {
                if (val.length >= 1) {
                  searchBloc.add(
                    Searching(term: val),
                  );
                } else if (val.length == 0) {
                  searchBloc.add(
                    ClearSearch(),
                  );
                }
              },
              controller: searcController,
              onFieldSubmitted: (e) {},
              focusNode: _focus,
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Theme.of(context).highlightColor, // .withOpacity(0.7)
                contentPadding: EdgeInsets.all(0),
                // prefixIcon: Icon(Icons.search),
                // prefixStyle: TextStyle(
                //     color: Theme.of(context).buttonColor,
                //     fontWeight: FontWeight.w700),
                hintText: 'Search ...',
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                ),
                border: defaulBorderInput(),
                focusedBorder: defaulBorderInput(),
                enabledBorder: defaulBorderInput(),
                disabledBorder: defaulBorderInput(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchWrapper() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).highlightColor,
      ),
      height: 40,
      child: Row(
        children: <Widget>[
          _iconTextFormField(),
          _inputSearch(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleIconButton(
          icon: Icons.arrow_back,
          color: Theme.of(context).primaryColorDark,
          bgColor: Theme.of(context).accentColor.withOpacity(.1),
          trigger: () {
            if (widget.from == 'nav') {
              Navigator.pop(context);
            }
            if (widget.from == 'tabs') {
              widget.controller!.animateTo(0);
            }
          },
        ),
        Expanded(
          child: _searchWrapper(),
        ),
        CircleIconButton(
          icon: Icons.more_vert,
          color: Theme.of(context).primaryColorDark.withOpacity(0.7),
          bgColor: Theme.of(context).accentColor.withOpacity(.1),
          trigger: () {},
        ),
      ],
    );
  }

  @override
  dispose() {
    super.dispose();
    // this.searcController.dispose();
  }
}
