import 'package:app_drinks/components/drink_item_card.dart';
import 'package:app_drinks/models/drink_detail.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/models/list_marked_drinks.dart';
import 'package:app_drinks/models/search.dart';
import 'package:app_drinks/screens/bookmark_details/bookmark_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GridListFavorite extends StatelessWidget {
  final Size _size;

  const GridListFavorite(this._size,{Key? key,}) : super(key: key);

   _runFilter(String enteredKeyword, List<MarkedDrink> listDrink) {
    List<MarkedDrink> results = [];
    if (enteredKeyword.isEmpty) {
      results = listDrink;
    } else {
      results = listDrink
          .where((user) =>
          _jsonConverter(user).toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    return results;
  }


  @override
  Widget build(BuildContext context) {
    var searchedDrinks = _runFilter(Provider.of<Search>(context, listen:true).word, Provider.of<ListMarkedDrinks>(context, listen: false).markedDrinks);
    return SizedBox(
      height: _size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(right:16.0),
        itemCount: searchedDrinks.length,
        itemBuilder: (BuildContext context, int index) {
          final MarkedDrink drink = searchedDrinks[index];
          final Drink drinkForCard = _jsonListConverter(searchedDrinks)[index];

          final int drinkId = drink.id!;

          return DrinkCard(drinkForCard.strDrinkThumb, drinkForCard.strDrink, () => _showDrinkDetail(context, drinkId));},
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent:300 ,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}



_jsonConverter(MarkedDrink json) {
  final DrinkDetails drink = drinkDetailsFromJson(json.json);
  final Drink drink2 = Drink(
    drink.drinks[0]['strDrink'],
    drink.drinks[0]['strDrinkThumb'],
    drink.drinks[0]['idDrink'],
  );
  return drink2.strDrink;
}

_jsonListConverter(List<MarkedDrink> list) {
  final List<DrinkDetails> drinksDetail = [];
  for (MarkedDrink map in list) {
    final DrinkDetails drink = drinkDetailsFromJson(map.json);
    drinksDetail.add(drink);
  }
  final List<Drink> drinks = [];
  for (DrinkDetails drinkDetails in drinksDetail) {
    final Drink drink = Drink(
      drinkDetails.drinks[0]['strDrink'],
      drinkDetails.drinks[0]['strDrinkThumb'],
      drinkDetails.drinks[0]['idDrink'],
    );
    drinks.add(drink);
  }
  return drinks;
}
_showDrinkDetail(BuildContext context, int drinkId) async {
  await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BookMarkDetails(id: drinkId)));
}
