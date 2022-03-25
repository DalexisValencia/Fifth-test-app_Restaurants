import 'package:flutter/cupertino.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/dishCard/newLaunch/comment/newLaunchCard__comment--header.dart';
import 'package:restaurants/widgets/dishCard/newLaunch/comment/newLaunchCard__comment--item.dart';

class NewLauchCardCommentWrapper extends StatelessWidget {
  final Dishes? dish;
  const NewLauchCardCommentWrapper({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewLauchCardCommentHeader(
          dish: dish!,
        ),
        NewLaunchCardCommentItems(
          comments: dish!.comments!,
        )
      ],
    );
  }
}
