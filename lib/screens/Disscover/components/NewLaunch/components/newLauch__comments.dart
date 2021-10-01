import 'package:restaurants/interfaces/Comments.dart';
import 'package:restaurants/screens/Disscover/components/NewLaunch/components/newLaunch__seeAllComments.dart';
import 'package:flutter/material.dart';

class NewLaunchComments extends StatelessWidget {
  final List<Comments>? comments;
  NewLaunchComments({
    this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> wComments = [];
          comments!.asMap().entries.map((e) {
            int idx = e.key;
            if (idx <= 1) {
              wComments.add(Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: (idx + 1) == comments!.length
                          ? Colors.transparent
                          : Theme.of(context).primaryColor.withOpacity(0.6),
                      width: 0.6,
                    ),
                  ),
                ),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          right: 10,
                        ),
                        width: 47,
                        height: 47,
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              comments![idx].name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  comments![idx].comment!.substring(0, 41) +
                                      '...',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
            }
          }).toList();
          if (comments!.length > 2) {
            wComments.add(
              SeeAllCommentsCard(),
            );
          }
          return Column(
            children: wComments,
          );
        },
      ),
    );
  }
}
