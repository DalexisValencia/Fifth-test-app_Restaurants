import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final Color iconColors;
  final String firstAction;
  final String secondAction;
  CustomHeader({this.firstAction, this.secondAction, this.iconColors});
  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  IconData _selectIconByName(param) {
    switch (param) {
      case 'goBack':
        return Icons.arrow_back;
        break;
      case 'search':
        return Icons.search;
        break;
      case 'favorite':
        return Icons.favorite;
        break;
      default:
    }
    return Icons.favorite;
  }

  void actions() {
    switch (widget.firstAction) {
      case 'goBack':
        Navigator.pop(context);
        break;
      case 'search':
        print('abrir Buscador');
        break;
      case 'favorite':
        print('añadir a favoritos');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: CircleIconButton(
              icon: _selectIconByName(widget.firstAction),
              color: widget.iconColors,
              bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
              trigger: () {
                print('acciones');
                actions();
                // Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: 40,
            height: 40,
            child: CircleIconButton(
              icon: _selectIconByName(widget.secondAction),
              color: widget.iconColors,
              bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
              trigger: () {},
            ),
          ),
        ],
      ),
    );
  }
}
