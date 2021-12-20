import 'package:app_drinks/components/drink_item_card.dart';
import 'package:app_drinks/models/drink_detail.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/screens/bookmark_details/bookmark_details.dart';
import 'package:flutter/material.dart';

class GridListFavorite extends StatefulWidget {
  const GridListFavorite( this.listDrink,this._size, this.word, {Key? key, }) : super(key: key);

  final Size _size;
  final List<MarkedDrink> listDrink;
  final String word;

  @override
  State<GridListFavorite> createState() => _GridListFavoriteState();
}

class _GridListFavoriteState extends State<GridListFavorite> {
  late List<MarkedDrink> searchedDrinks = [];

  void _runFilter(String enteredKeyword) {
    List<MarkedDrink> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.listDrink;
    } else {
      results = widget.listDrink
          .where((user) =>
          _jsonConverter(user).toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() => searchedDrinks = results);
  }


  @override
  Widget build(BuildContext context) {
    _runFilter(widget.word);
    return SizedBox(
      height: widget._size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(right:16.0),
        itemCount: searchedDrinks.length,
        itemBuilder: (BuildContext context, int index) {
          final MarkedDrink drink = searchedDrinks[index];
          final Drink drinkForCard = _jsonListConverter(searchedDrinks)[index];

          return DrinkCard(drinkForCard.strDrinkThumb, drinkForCard.strDrink, () => _showDrinkDetail(context, drink.id));},
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
_showDrinkDetail(BuildContext context, int? drinkId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BookMarkDetails(id: drinkId)));
}