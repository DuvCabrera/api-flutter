import 'package:flutter/material.dart';

import 'screens/page_manager/page_manager.dart';

void main() {
  runApp(const DrinkFinder());
}

class DrinkFinder extends StatelessWidget {
  const DrinkFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageManager());
  }
}