import 'package:app_drinks/components/title_bar.dart';
import 'package:app_drinks/http/web_clients/drink_detail_webclient.dart';
import 'package:app_drinks/screens/details/components/drink_detail.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final String drinkId;

  Body({Key? key, required this.drinkId}) : super(key: key);

  final DrinkDetailWebClient _drinkDetailWebClient = DrinkDetailWebClient();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleBar(size, "Drink Detail"),
          FutureDetail(
            drinkId: drinkId,
            drinkDetailWebClient: _drinkDetailWebClient,
            size: size,
          ),
        ],
      ),
    );
  }
}
