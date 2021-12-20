import 'package:app_drinks/http/web_client.dart';
import 'package:app_drinks/http/web_clients/drink_types_webclient.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/screens/full_list/full_list.dart';
import 'package:app_drinks/screens/home/components/future_list.dart';
import 'package:app_drinks/screens/home/components/text_with_btn.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../components/title_bar_without_back_button.dart';

class Body extends StatelessWidget {
  final DrinkTypesWebClient drinkTypesList = DrinkTypesWebClient();

  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MainTitleBar(size, 'Lets Make Some Drinks'),
        TextWithBtn(
            'Alcoholic Drinks',
            () async => _showDrinksList(
                context, await drinkTypesList.getDrinksList(alcoholic))),
        FutureList(
            boxSize: 300.0,
            drinkType: alcoholic,
            drinkWebClient: drinkTypesList),
        TextWithBtn(
          'Drinks Without Alcohol',
          () async => _showDrinksList(
              context, await drinkTypesList.getDrinksList(nonAlcoholic)),
        ),
        FutureList(
            boxSize: 300.0,
            drinkType: nonAlcoholic,
            drinkWebClient: drinkTypesList),
        const SizedBox(height: kDefaultPadding),
      ]),
    );
  }
}

_showDrinksList(BuildContext context, ListDrink listDrink) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FullList(listDrink.drinks)));
}
