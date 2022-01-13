import 'package:app_drinks/components/centered_message.dart';
import 'package:app_drinks/components/progress.dart';
import 'package:app_drinks/database/dao/drink_dao.dart';
import 'package:app_drinks/models/drink_detail.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:app_drinks/screens/bookmark_details/components/favorite_detail_drink.dart';
import 'package:flutter/material.dart';

class FavoriteFuture extends StatelessWidget {
  FavoriteFuture (this.size, this.id,  {Key? key, }) : super(key: key);
  final int id;
  final Size size;

  final DrinkDao _dao = DrinkDao();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dao.selectById(id),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Progress();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null){
                final MarkedDrink drinkDetails = snapshot.data as MarkedDrink;
                return FavoriteDetailsDrink(_jsonConverter(drinkDetails), size, id);
              }else {
                return const CenteredMessage('Data Not Founded', icon: Icons.warning,);
              }
          }
          return const CenteredMessage('Unknown Error', icon: Icons.warning);
        });
  }
}
_jsonConverter(MarkedDrink json) {
  final DrinkDetails drink = drinkDetailsFromJson(json.json);
  return drink;
}