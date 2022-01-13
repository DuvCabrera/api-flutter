import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/screens/full_list/components/all_drinks_grid.dart';
import 'package:app_drinks/screens/full_list/components/title_with_searchbar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Drink> listDrink;

  const Body(this.listDrink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TitleWithSearchBar(size, 'Chose One'),
         AllDrinksGrid(listDrink, size),
        ],
      ),
    );
  }
}
