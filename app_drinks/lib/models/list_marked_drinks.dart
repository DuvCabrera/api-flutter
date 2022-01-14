import 'package:app_drinks/database/dao/drink_dao.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:flutter/widgets.dart';

class ListMarkedDrinks extends ChangeNotifier {
  List<MarkedDrink> _markedDrinks = [];

  final DrinkDao _dao = DrinkDao();

  List<MarkedDrink> get markedDrinks => _markedDrinks;

  changeList(list) {
    _markedDrinks = list;
  }

  deleteMarkedDrink(id) {
    _markedDrinks.removeWhere((element) => element.id == id);
    _dao.deleteDrink(id);
    notifyListeners();
  }

  findMarkedDrink(id) {
    var item = _markedDrinks.where((element) {
      return element.id == id;
    }).toList();
    return item[0];
  }
}