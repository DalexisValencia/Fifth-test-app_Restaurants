import 'package:fith_app__restaurant/blocs/bloc/additional/additionals_bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/dish/bloc/dish_bloc.dart';
import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/interfaces/aditional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class AdditionalExample extends StatefulWidget {
//   @override
//   _AdditionalExampleState createState() => _AdditionalExampleState();
// }

// class _AdditionalExampleState extends State<AdditionalExample> {
//   @override
//   Widget build(BuildContext context) {
//     final additionalsBloc = BlocProvider.of<AdditionalsBloc>(context);
//     return BlocBuilder<AdditionalsBloc, AdditionalsState>(
//       builder: (BuildContext context, AdditionalsState state) {
//         List<String> bune = state.props[0];
//         print(bune.length);
//         return Builder(
//           builder: (BuildContext context) {
//             List<Widget> left = [];
//             bune.map((e) {
//               left.add(Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(e),
//                   RaisedButton(
//                     onPressed: () {
//                       additionalsBloc.add(UpdateAditionalState(additional: e));
//                     },
//                     child: Text("cambiar name"),
//                   )
//                 ],
//               ));
//             }).toList();
//             return Column(
//               children: left,
//             );
//           },
//         );
//         // return ListView.builder(
//         //     scrollDirection: Axis.vertical,
//         //     itemCount: bune.length,
//         //     itemBuilder: (BuildContext context, int ind) {
//         //       return Text("la iunfo");
//         //       // return Text("${state.props[0][ind]}");
//         //     });
//       },
//     );
//   }
// }

class AditionalExpansionPanel extends StatefulWidget {
  final int index;
  final Adittional additional;
  AditionalExpansionPanel({this.index, this.additional});
  @override
  _AditionalExpansionPanelState createState() =>
      _AditionalExpansionPanelState();
}

class _AditionalExpansionPanelState extends State<AditionalExpansionPanel> {
  bool isActivePanel = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     child: Column(children: <Widget>[
    //   Text(widget.additional.title),
    //   BlocBuilder<AdditionalsBloc, AdditionalsState>(
    //     builder: (BuildContext context, AdditionalsState state) {
    //       List<Adittional> aditionals = state.props[0];
    //       List<Widget> children = [];
    //       // print(aditionals[widget.index]);
    //       // print(state.props[0]);
    //       //widget.additional
    //       aditionals[widget.index].children.asMap().entries.map((option) {
    //         AditionalsOptions adicionalOption = option.value;
    //         // print(adicionalOption.isActive);
    //         children.add(Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               Text(adicionalOption.name),
    //               RaisedButton(
    //                 onPressed: () {
    //                   BlocProvider.of<AdditionalsBloc>(context).add(
    //                       ToggleModifier(
    //                           parent: widget.index,
    //                           item: option.value,
    //                           rid: option.key));
    //                 },
    //                 child: Text(adicionalOption.isActive.toString()),
    //               )
    //             ]));
    //       }).toList();
    //       return Column(
    //         children: children,
    //       );
    //     },
    //   )
    // ]));

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
          widget.additional.title,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        children: <Widget>[
          Container(child: BlocBuilder<AdditionalsBloc, AdditionalsState>(
              builder: (BuildContext context, AdditionalsState state) {
            List<Adittional> aditionals = state.props[0];
            List<Widget> optionsExpansion = [];
            aditionals[widget.index].children.asMap().entries.map((option) {
              optionsExpansion.add(AditionalCheckBoxTile(
                index: option.key,
                name: option.value.name,
                price: option.value.price,
                active: option.value.isActive,
                // active: widget.additional.isMulti
                //     ? option.value.isActive
                //     : currentActive == option.key,
                isMulti: widget.additional.isMulti,
                callBackClick: (val, inx) {
                  // print('its me?');
                  BlocProvider.of<AdditionalsBloc>(context).add(ToggleModifier(
                      parent: widget.index,
                      item: option.value,
                      rid: option.key));
                },
              ));
            }).toList();

            return Column(
              children: optionsExpansion,
            );
          }))
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
      widget.callBackClick(val, widget.index);
    }
  }

  changeNotifierWidgetParent() {
    // solo si la seleccion no es multiple
    // if (!widget.isMulti) {
    setState(() {
      isCurrentCheckActive = widget.active;
    });
    // }
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
