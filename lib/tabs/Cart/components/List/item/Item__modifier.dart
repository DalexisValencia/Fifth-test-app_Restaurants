import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/aditional.dart';
import 'package:flutter/material.dart';

class ExpansionModifiersCartItem extends StatefulWidget {
  final List<Adittional>? additionals;
  ExpansionModifiersCartItem({
    this.additionals,
  });
  @override
  _ExpansionModifiersCartItemState createState() =>
      _ExpansionModifiersCartItemState();
}

class _ExpansionModifiersCartItemState
    extends State<ExpansionModifiersCartItem> {
  bool showModifiers = false;
  void activeModifiers() {
    setState(() {
      showModifiers = !showModifiers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              activeModifiers();
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * defaultPadding,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).buttonColor,
                borderRadius: showModifiers
                    ? BorderRadius.circular(0)
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(
                          borderRadiusCards,
                        ),
                        bottomRight: Radius.circular(
                          borderRadiusCards,
                        ),
                      ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Modificadores",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Icon(
                    showModifiers
                        ? Icons.arrow_drop_up_rounded
                        : Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).primaryColorLight,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: showModifiers,
            child: AnimatedOpacity(
              opacity: !showModifiers ? 0 : 1,
              duration: Duration(
                milliseconds: animationOpacityTime,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width * defaultPadding,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  border: Border.all(
                    color: Theme.of(context).primaryColorDark.withOpacity(0.4),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Builder(
                  builder: (BuildContext context) {
                    List<Widget> modifiers = [];
                    widget.additionals!.map((e) {
                      Iterable<AditionalsOptions> isActive = e.children!
                          .where((element) => element.isActive == true);
                      for (var option in isActive) {
                        modifiers.add(
                          ModifiersOption(
                            option: option,
                          ),
                        );
                      }
                    }).toList();
                    return Column(
                      children: modifiers,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModifiersOption extends StatelessWidget {
  final AditionalsOptions? option;
  ModifiersOption({this.option});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option!.name!,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
          Text(
            option!.price != 0 ? "\$${formatterPrice(option!.price)}" : 'Yes',
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
        ],
      ),
    );
  }
}
