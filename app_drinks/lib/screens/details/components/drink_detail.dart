import 'package:app_drinks/components/centered_message.dart';
import 'package:app_drinks/components/progress.dart';
import 'package:app_drinks/http/web_clients/drink_detail_webclient.dart';
import 'package:app_drinks/models/drink_detail.dart';
import 'package:app_drinks/screens/details/components/detail_of_drink.dart';
import 'package:flutter/material.dart';

class FutureDetail extends StatelessWidget {
  final DrinkDetailWebClient drinkDetailWebClient;
  final String drinkId;
  final Size size;


  const FutureDetail(
      {Key? key,
      required this.drinkDetailWebClient,
      required this.drinkId,
      required this.size})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: drinkDetailWebClient.getDrinkDetail(drinkId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final DrinkDetails drinkDetails = snapshot.data as DrinkDetails;
              return DetailOfDrink(drinkDetails, size);
          }
          return const CenteredMessage('Unknown Error', icon: Icons.warning);
        });
  }
}

