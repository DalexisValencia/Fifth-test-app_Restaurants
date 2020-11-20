import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class ArrowBackHeaderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CircleIconButton(
        icon: Icons.arrow_back,
        color: Theme.of(context).primaryColorDark,
        bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
        trigger: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class TrashFavoriteHeaderButton extends StatefulWidget {
  final int amout;
  TrashFavoriteHeaderButton({this.amout});
  @override
  _TrashFavoriteHeaderButtonState createState() =>
      _TrashFavoriteHeaderButtonState();
}

class _TrashFavoriteHeaderButtonState extends State<TrashFavoriteHeaderButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          CircleIconButton(
            icon: Icons.delete,
            color: Theme.of(context).primaryColorDark,
            bgColor: Theme.of(context).primaryColorDark.withOpacity(0.2),
            trigger: () {
              print(
                  "Comunicarse con el bloque de favoritos y eliminar esto!!!");
            },
          ),
          Positioned(
            top: 2,
            left: 3,
            child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 400,
                ),
                width: widget.amout == 0 || widget.amout == null ? 0 : 16,
                height: widget.amout == 0 || widget.amout == null ? 0 : 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedOpacity(
                  opacity: widget.amout == 0 || widget.amout == null ? 0 : 1,
                  duration: Duration(
                    milliseconds: 700,
                  ),
                  child: Center(
                    child: Text(
                      widget.amout == 0 || widget.amout == null
                          ? ''
                          : widget.amout.toString(),
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: widget.amout >= 10 ? 7 : 9,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColorLight,
                          ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
