import 'package:app_drinks/components/centered_message.dart';
import 'package:app_drinks/components/progress.dart';
import 'package:app_drinks/http/web_clients/drink_types_webclient.dart';
import 'package:app_drinks/models/list_drink.dart';
import 'package:app_drinks/screens/home/components/list_of_drinks.dart';
import 'package:flutter/material.dart';

class FutureList extends StatefulWidget {
  final DrinkTypesWebClient drinkWebClient;
  final String drinkType;
  final double boxSize;

  const FutureList(
      {Key? key,
      required this.boxSize,
      required this.drinkType,
      required this.drinkWebClient})
      : super(key: key);

  @override
  State<FutureList> createState() => _FutureListState();
}

class _FutureListState extends State<FutureList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.drinkWebClient.getDrinksList(widget.drinkType),
      builder: (BuildContext context, AsyncSnapshot<ListDrink> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return const Progress();
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const CenteredMessage('Page not founded', icon: Icons.warning);
            }
            final ListDrink listDrinks = snapshot.data as ListDrink;
            return Container(
                height: widget.boxSize,
                padding: const EdgeInsets.all(8.0),
                child: ListOfDrinks(listDrinks));
        }
        return const CenteredMessage('Unknown Error', icon: Icons.warning);
      },
    );
  }
}
