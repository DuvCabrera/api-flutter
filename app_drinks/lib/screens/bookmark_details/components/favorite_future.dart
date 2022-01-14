import 'package:app_drinks/models/drink_detail.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:app_drinks/models/list_marked_drinks.dart';
import 'package:app_drinks/screens/bookmark_details/components/favorite_detail_drink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteFuture extends StatelessWidget {
  const FavoriteFuture (this.size, this.id,  {Key? key, }) : super(key: key);
  final int id;
  final Size size;


  @override
  Widget build(BuildContext context) {

    final ListMarkedDrinks listMarkedDrinks = Provider.of<ListMarkedDrinks>(context, listen: false);
    final drinkDetails = listMarkedDrinks.findMarkedDrink(id);
    return FavoriteDetailsDrink(_jsonConverter(drinkDetails), size, id);
    }
}
_jsonConverter(MarkedDrink drinkMarked) {
  final DrinkDetails drink = drinkDetailsFromJson(drinkMarked.json);
  return drink;
}
