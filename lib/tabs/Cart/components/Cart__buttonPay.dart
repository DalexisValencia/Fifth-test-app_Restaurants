import 'package:fith_app__restaurant/blocs/bloc/cart/bloc/cart_bloc.dart';
import 'package:fith_app__restaurant/constants/contansts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (BuildContext context, CartState state) {
              print(state.props[1]);
              return RichText(
                text: TextSpan(
                    text: 'TOTAL: ',
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.w800,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\$${formatterPrice(state.props[1])}",
                      )
                    ]),
              );
            },
          ),
          RaisedButton(
            color: Theme.of(context).primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            child: Text(
              "Go Pay",
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Theme.of(context).buttonColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
