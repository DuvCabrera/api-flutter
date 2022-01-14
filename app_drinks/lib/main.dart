import 'package:app_drinks/models/list_marked_drinks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/page_manager/page_manager.dart';

void main() {
  runApp(const DrinkFinder());
}

class DrinkFinder extends StatelessWidget {
  const DrinkFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ListMarkedDrinks(), child: const MaterialApp(
        home: PageManager()));
  }
}