import 'package:flutter/material.dart';

class CardCarAddAmount extends StatelessWidget {
  final Function? add;
  final Function? substract;
  final int? amount;
  const CardCarAddAmount({
    Key? key,
    this.add,
    this.substract,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: 35,
      height: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => add!(),
              child: Container(
                color: Theme.of(context).buttonColor,
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                width: 35,
              ),
            ),
          ),
          Container(
            height: 30,
            child: Center(
              child: Text(
                amount!.toString(),
                style: Theme.of(context).textTheme.button!.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).primaryColorDark,
                    ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: amount == 1 ? null : () => substract!(),
              child: Container(
                color: amount == 1
                    ? Theme.of(context).primaryColor.withOpacity(0.4)
                    : Theme.of(context).buttonColor,
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 17,
                      color: amount == 1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
                height: 25,
                width: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
