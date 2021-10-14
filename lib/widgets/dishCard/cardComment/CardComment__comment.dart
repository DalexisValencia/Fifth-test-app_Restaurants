import 'package:flutter/material.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/interfaces/Dishes.dart';

class CardCommentItem extends StatelessWidget {
  final Dishes? dish;
  const CardCommentItem({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: totalWidth * 0.03,
        right: totalWidth * 0.04,
      ),
      padding: EdgeInsets.only(top: totalWidth * 0.01),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.3,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      width: totalWidth * 0.80,
      height: 55,
      child: Stack(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    splitName(dish!.comments![0].name!),
                  ),
                ),
                SizedBox(
                  width: totalWidth * 0.03,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        dish!.comments![0].name!,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: totalWidth * 0.01,
                      ),
                      Text(
                        dish!.comments![0].comment!.substring(0, 60) + '...',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 9),
                      )
                    ],
                  ),
                )
              ],
            ),
            width: totalWidth,
          )
        ],
      ),
    );
  }
}
