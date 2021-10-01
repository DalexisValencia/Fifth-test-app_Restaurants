import 'package:flutter/material.dart';
import 'package:restaurants/interfaces/Ingredients.dart';

class SummaryIngredients extends StatefulWidget {
  final List<Ingredients>? ingredients;
  SummaryIngredients({
    this.ingredients,
  });
  @override
  _SummaryIngredientsState createState() => _SummaryIngredientsState();
}

class _SummaryIngredientsState extends State<SummaryIngredients> {
  Widget _header() {
    return Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Ingreddients for plate',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark),
          ),
        ));
  }

  Widget _ingredientsList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
          itemCount: widget.ingredients!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _cardIngredients(widget.ingredients![index]);
          }),
    );
  }

  Widget _cardIngredients(Ingredients ingredient) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(5)),
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.010),
        width: (MediaQuery.of(context).size.width / 4) -
            MediaQuery.of(context).size.width * 0.028,
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  ingredient.amountGrams!,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColorDark),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  ingredient.name!,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 9,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColorDark),
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.018,
          top: MediaQuery.of(context).size.height * 0.025),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_header(), _ingredientsList()],
      ),
    );
  }
}
