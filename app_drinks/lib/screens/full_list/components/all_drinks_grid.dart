import 'package:app_drinks/components/grid_list.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/models/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllDrinksGrid extends StatelessWidget {
  AllDrinksGrid(
    this.listDrink,
    this.size, {
    Key? key,
  }) : super(key: key);

  final List<Drink> listDrink;
  final Size size;
  List<Drink> searchedDrinks = [];

  void _runFilter(String enteredKeyword) {
    List<Drink> results = [];
    if (enteredKeyword.isEmpty) {
      results = listDrink;
    } else {
      results = listDrink
          .where((user) => user.strDrink
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    searchedDrinks = results;
  }

  @override
  Widget build(BuildContext context) {
    _runFilter(Provider.of<Search>(context, listen: true).word);
    return GridList(searchedDrinks, size);
  }
}
