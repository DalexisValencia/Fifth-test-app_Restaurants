import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/blocs/bloc/favorites/bloc/favorites_bloc.dart';
import 'package:restaurants/constants/contansts.dart';
import 'package:restaurants/tabs/Favorites/favorites.dart';
import 'package:restaurants/widgets/Button_roundWithIcon.dart';
import 'package:flutter/material.dart';

class FixedTopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width * defaultPadding) - 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleIconButton(
            icon: Icons.menu,
            color: Theme.of(context).primaryColorLight,
            bgColor: Theme.of(context).primaryColor.withOpacity(0.5),
            trigger: () {},
          ),
          CircleIconButton(
            icon: Icons.favorite,
            color: Theme.of(context).primaryColorLight,
            bgColor: Theme.of(context).primaryColorLight.withOpacity(0.4),
            trigger: () {
              Navigator.of(context).push(MaterialPageRoute<FavoritesScreen>(
                builder: (context) {
                  return BlocProvider.value(
                    value: favoritesBloc,
                    child: FavoritesScreen(),
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
