import 'package:app_drinks/components/drink_item_card.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/screens/details/drink_details.dart';
import 'package:flutter/material.dart';

class ListOfDrinks extends StatelessWidget {
  final ListDrink listDrinks;
  const ListOfDrinks(this.listDrinks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listDrinks.drinks.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Drink drink = listDrinks.drinks[index];
          return DrinkCard(drink.strDrinkThumb, drink.strDrink, () => _showDrinkDetail(context, drink.idDrink));
        });
  }
}

_showDrinkDetail(BuildContext context, String drinkId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DrinkDetailsScreen(drinkId: drinkId)));
}
