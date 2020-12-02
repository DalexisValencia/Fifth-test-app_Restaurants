import 'package:fith_app__restaurant/widgets/roundedIconsButtons.dart';
import 'package:flutter/material.dart';

class TrashButton extends StatefulWidget {
  final int amout;
  final Function onClick;
  TrashButton({
    this.amout,
    this.onClick,
  });
  @override
  _TrashButtonState createState() => _TrashButtonState();
}

class _TrashButtonState extends State<TrashButton> {
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
            trigger: widget.onClick,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
