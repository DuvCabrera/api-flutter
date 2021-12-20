import 'package:app_drinks/components/title_bar.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/components/search_grid_list.dart';
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
        children: [
          TitleBar(size, 'Chose One'),
          SearchGridList(listDrink, size),
        ],
      ),
    );
  }
}
