import 'package:fith_app__restaurant/interfaces/Dishes.dart';
import 'package:fith_app__restaurant/screens/details.dart';
import 'package:fith_app__restaurant/widgets/iconAndText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Bloc pattern:
import 'package:bloc/bloc.dart';
import 'package:fith_app__restaurant/blocs/bloc/productdetails_bloc.dart';

class QuickView extends StatefulWidget {
  final Dishes dish;
  QuickView({this.dish});
  @override
  _QuickViewState createState() => _QuickViewState();
}

class _QuickViewState extends State<QuickView> {
  // ProductdetailsBloc blocProduct;
  @override
  void initState() {
    // blocProduct = BlocProvider.of<ProductdetailsBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    // blocProduct.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(blocProduct);
    return Container(
      decoration: BoxDecoration(
          //   boxShadow: [
          //   BoxShadow(
          //     color: Theme.of(context).primaryColor.withOpacity(0.2),
          //     blurRadius: 2,
          //     offset: Offset(-1, -1),
          //   )
          // ],
          border:
              Border.all(color: Theme.of(context).accentColor.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: 5),
      child: MaterialButton(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          color: Theme.of(context).primaryColorLight,
          padding: EdgeInsets.all(0),
          splashColor: Colors.red,
          onPressed: () {
            print(widget.dish);
            // blocProduct.add(ProductdetailsCurrent(product: 'detallado'));
            // Navigator.of(context)
            //     .push(MaterialPageRoute<ProductdetailsBloc>(builder: (context) {
            //   return BlocProvider.value(
            //     value: blocProduct,
            //     child: DetailsWrapper(),
            //   );
            // }));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: ExactAssetImage(widget.dish.image))),
                ),
                Expanded(
                  child: Container(
                    height: 90,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Text(
                            widget.dish.name,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.width *
                                      0.015),
                              child: Text(
                                widget.dish.details.substring(0, 80) + '...',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            )),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.width * 0.03),
                            child: Row(
                              children: <Widget>[
                                IconAndText(
                                    icon: Icons.star,
                                    iconColor: Theme.of(context).buttonColor,
                                    iconSize: 16,
                                    text: '${widget.dish.rating} Votes',
                                    textColor:
                                        Theme.of(context).primaryColorDark,
                                    textSize: 12),
                                Spacer(),
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        onTap: () {
                                          print('Ir al detallado del producto');
                                        },
                                        splashColor:
                                            Theme.of(context).buttonColor,
                                        child: IconAndText(
                                            icon: Icons.add_shopping_cart,
                                            iconColor:
                                                Theme.of(context).buttonColor,
                                            iconSize: 16,
                                            text:
                                                '\$${widget.dish.price.toInt()}', //\$
                                            textColor: Theme.of(context)
                                                .primaryColorDark,
                                            textSize: 12)))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
