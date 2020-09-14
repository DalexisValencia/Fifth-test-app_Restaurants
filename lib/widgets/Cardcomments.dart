import 'package:fith_app__restaurant/interfaces/Comments.dart';
import 'package:flutter/material.dart';

class CardComments extends StatelessWidget {
  final List<Comments> comments;
  CardComments({this.comments});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          List<Widget> wComments = [];
          comments.asMap().entries.map((e) {
            int idx = e.key;
            if (idx <= 1) {
              wComments.add(Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: (idx + 1) == comments.length
                                ? Colors.transparent
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                            width: 0.6))),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10),
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
                              comments[idx].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.bold),
                            ),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  comments[idx].comment.substring(0, 41) +
                                      '...',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                          color:
                                              Theme.of(context).primaryColor),
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
          if (comments.length > 2) {
            wComments.add(SeeAllCommentsCard());
          }
          return Column(
            children: wComments,
          );
        },
      ),
    );
  }
}

class SeeAllCommentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        splashColor: Theme.of(context).buttonColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minWidth: 10,
        height: 10,
        onPressed: () {
          print('Ver todos los comentarios de un plato');
        },
        child: Text(
          "See All",
          style: TextStyle(
              fontSize: 10, color: Theme.of(context).primaryColorDark),
        ),
      ),
    );
  }
}
