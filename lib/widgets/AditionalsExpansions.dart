import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:flutter/material.dart';

class AditionalExpansionPanel extends StatefulWidget {
  final String title;
  final bool isMulti;
  final List<AditionalsOptions> children;
  AditionalExpansionPanel({this.title, this.isMulti, this.children});
  @override
  _AditionalExpansionPanelState createState() =>
      _AditionalExpansionPanelState();
}

class _AditionalExpansionPanelState extends State<AditionalExpansionPanel> {
  int currentActive = 0;
  bool isActivePanel = false;

  @override
  initState() {
    currentActive = widget.children.length +
        1; //Desactiva el primer elemento seleccionado por defecto
    super.initState();
  }

  checkFlowCheckBox(val, inx) {
    if (!val) {
      setState(() {
        currentActive = 100;
      });
    }

    if (val) {
      setState(() {
        currentActive = inx;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: isActivePanel
              ? Border(
                  top: BorderSide(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.5),
                      width: 1),
                  left: BorderSide(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.5),
                      width: 1),
                  right: BorderSide(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.5),
                      width: 1),
                  bottom: BorderSide(color: Colors.red, width: 0),
                )
              : Border.all(
                  width: 1,
                  color: isActivePanel
                      ? Colors.red
                      : Theme.of(context).primaryColorDark.withOpacity(0.5)),
          color: Theme.of(context).primaryColorLight),
      child: ExpansionTile(
        onExpansionChanged: (val) {
          setState(() {
            isActivePanel = val;
          });
        },
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        children: <Widget>[
          Container(
            child: Builder(
              builder: (BuildContext context) {
                List<Widget> optionsExpansion = [];
                widget.children.asMap().entries.map((option) {
                  optionsExpansion.add(AditionalCheckBoxTile(
                      index: option.key,
                      name: option.value.name,
                      price: option.value.price,
                      active: widget.isMulti
                          ? option.value.isActive
                          : currentActive == option.key,
                      isMulti: widget.isMulti,
                      callBackClick: (val, inx) =>
                          checkFlowCheckBox(val, inx)));
                }).toList();
                return Column(
                  children: optionsExpansion,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class AditionalCheckBoxTile extends StatefulWidget {
  final int index;
  final String name;
  final int price;
  final bool active;
  final Function callBackClick;
  final bool isMulti;

  AditionalCheckBoxTile(
      {this.index,
      this.name,
      this.active,
      this.callBackClick,
      this.isMulti,
      this.price});
  @override
  _AditionalCheckBoxTileState createState() => _AditionalCheckBoxTileState();
}

class _AditionalCheckBoxTileState extends State<AditionalCheckBoxTile> {
  bool isCurrentCheckActive = false;
  _activeOption(val) {
    // si la seleccion no es multiple
    if (!widget.isMulti) {
      widget.callBackClick(val, widget.index);
    }
    // Si la seleccion es multiple
    if (widget.isMulti) {
      setState(() {
        this.isCurrentCheckActive = val;
      });
    }
  }

  changeNotifierWidgetParent() {
    // solo si la seleccion no es multiple
    if (!widget.isMulti) {
      setState(() {
        isCurrentCheckActive = widget.active;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.changeNotifierWidgetParent();
  }

  @override
  Widget build(BuildContext context) {
    this.changeNotifierWidgetParent();
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.2)))),
      child: CheckboxListTile(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Theme.of(context).primaryColorDark),
              ),
              widget.price.toString() != '0'
                  ? Text(
                      "\$" + widget.price.toString(),
                      style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w700),
                    )
                  : SizedBox(
                      width: 10,
                      height: 0,
                    ),
            ],
          ),
        ),
        activeColor: Theme.of(context).buttonColor,
        value: isCurrentCheckActive,
        onChanged: (val) => _activeOption(val),
      ),
    );
  }
}
