import 'package:app_drinks/components/centered_message.dart';
import 'package:app_drinks/components/progress.dart';
import 'package:app_drinks/database/dao/drink_dao.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:app_drinks/models/list_marked_drinks.dart';
import 'package:app_drinks/screens/bookmarks/components/grid_list_favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureGridList extends StatelessWidget {
  FutureGridList(
    this._size, {
    Key? key,
  }) : super(key: key);
  final Size _size;
  final DrinkDao _dao = DrinkDao();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dao.findAll(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return const Progress();
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.data != null) {
              Provider.of<ListMarkedDrinks>(context, listen: true).changeList(snapshot.data as List<MarkedDrink>);
              return GridListFavorite(_size);
            } else {
              return const CenteredMessage(
                'There are no items in de list',
                icon: Icons.list_alt,
              );
            }
        }
        return const CenteredMessage('Unknown Error', icon: Icons.warning);
      },
    );
  }
}

//final favoriteList = snapshot.data as List<MarkedDrink>;
// return GridListFavorite(favoriteList, _size);