import 'package:app_drinks/components/drink_item_card.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/screens/details/drink_details.dart';
import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final List<Drink> _listDrink;
  final Size _size;
  const GridList(this._listDrink,  this._size, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(right:16.0),
        itemCount: _listDrink.length,
        itemBuilder: (BuildContext context, int index) {
          final Drink drink = _listDrink[index];
          return DrinkCard(drink.strDrinkThumb, drink.strDrink, () => _showDrinkDetail(context, drink.idDrink));},
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent:300 ,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

_showDrinkDetail(BuildContext context, String drinkId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DrinkDetailsScreen(drinkId: drinkId)));
}


