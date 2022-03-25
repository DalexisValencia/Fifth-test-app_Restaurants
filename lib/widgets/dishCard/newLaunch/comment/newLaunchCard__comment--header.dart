import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Dishes.dart';
import 'package:restaurants/widgets/Card__CustomChip.dart';

class NewLauchCardCommentHeader extends StatelessWidget {
  final Dishes? dish;
  const NewLauchCardCommentHeader({
    Key? key,
    this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                width: 0.6,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.010,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            dish!.name!,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            dish!.details!.substring(0, 28) + '...',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.restaurant_menu,
                    size: 20,
                    color: Theme.of(context).primaryColorLight,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.6),
                width: 0.6,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomChip(
                text: '4.8 votes',
                textColor: Theme.of(context).primaryColorDark,
                textSize: 11,
                icon: Icons.star,
                iconColor: Theme.of(context).buttonColor,
                iconSize: 13,
              ),
              CustomChip(
                text: '30 minutes',
                textColor: Theme.of(context).primaryColorDark,
                textSize: 11,
                icon: Icons.timer,
                iconColor: Theme.of(context).primaryColorDark,
                iconSize: 13,
              ),
              InkWell(
                onTap: () {
                  print("reservar est plato");
                },
                child: CustomChip(
                  text: 'Reserve',
                  textColor: Theme.of(context).primaryColorDark,
                  textSize: 11,
                  icon: Icons.assignment,
                  iconColor: Theme.of(context).primaryColorDark,
                  iconSize: 13,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
