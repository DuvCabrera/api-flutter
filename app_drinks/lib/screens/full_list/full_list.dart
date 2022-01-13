import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/models/search.dart';
import 'package:app_drinks/screens/full_list/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullList extends StatelessWidget {
  final List<Drink> listDrink;

  const FullList( this.listDrink, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Search(), child: Scaffold(body: Body(listDrink),),);
  }
}
