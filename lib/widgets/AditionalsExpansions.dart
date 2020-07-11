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
          border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColorDark.withOpacity(0.5)),
          color: Theme.of(context).primaryColorLight),
      child: ExpansionTile(
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
  final bool active;
  final Function callBackClick;
  final bool isMulti;

  AditionalCheckBoxTile(
      {this.index, this.name, this.active, this.callBackClick, this.isMulti});
  @override
  _AditionalCheckBoxTileState createState() => _AditionalCheckBoxTileState();
}

class _AditionalCheckBoxTileState extends State<AditionalCheckBoxTile> {
  bool isCurrentCheckActive = false;
  _activeOption(val) {
    if (!widget.isMulti) {
      widget.callBackClick(val, widget.index);
    }
    if (widget.isMulti) {
      setState(() {
        this.isCurrentCheckActive = val;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print("pintalo!!");
      isCurrentCheckActive = widget.active;
    });
    return Container(
      decoration: BoxDecoration(
          // color: Colors.yellow,
          border: Border(
              top: BorderSide(
                  width: 1,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.2)))),
      child: CheckboxListTile(
        // controlAffinity: ListTileControlAffinity.leading,
        title: Text(widget.name),
        activeColor: Theme.of(context).buttonColor,
        value: isCurrentCheckActive,
        onChanged: (val) => _activeOption(val),
      ),
    );
  }
}
