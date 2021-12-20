import 'package:app_drinks/screens/details/components/body.dart';
import 'package:flutter/material.dart';

class DrinkDetailsScreen extends StatelessWidget {
  final String drinkId;

  const DrinkDetailsScreen({Key? key, required this.drinkId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(drinkId: drinkId,),);
  }
}
