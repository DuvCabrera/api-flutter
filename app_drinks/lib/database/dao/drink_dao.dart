import 'package:app_drinks/database/app_database.dart';
import 'package:app_drinks/models/drink_detail.dart';
import 'package:app_drinks/models/favorite_drink.dart';
import 'package:sqflite/sqflite.dart';

class DrinkDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_json TEXT)';

  static const String _tableName = 'drinks';
  static const String _id = 'id';
  static const String _json = 'json';

  Future<int> saveDrink(DrinkDetails drink) async {
    final Database db = await createDataBase();
    final String json = drinkDetailsToJson(drink);
    final MarkedDrink favoriteDrink = MarkedDrink(json);
    return db.insert(_tableName, favoriteDrink.toMap());
  }

  Future<MarkedDrink> selectById(int? id) async {
    final Database db = await createDataBase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableName, where: '$_id = ?', whereArgs: [id]);
    List<MarkedDrink> drinks = _toList(result);
    MarkedDrink markedDrink = MarkedDrink("");
    for (MarkedDrink drink in drinks) {
      if (drink.id == id) {
        markedDrink = drink;
      }
    }
    return markedDrink;
  }

  Future<List<MarkedDrink>> findAll() async {
    final Database db = await createDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<MarkedDrink> drinksList = _toList(result);
    return drinksList;
  }

  List<MarkedDrink> _toList(List<Map<String, dynamic>> result) {
    final List<MarkedDrink> drinks = [];
    for (Map<String, dynamic> map in result) {
      final MarkedDrink drink = MarkedDrink(
        map[_json],
        id: map[_id],
      );
      drinks.add(drink);
    }
    return drinks;
  }

  Future<int> deleteDrink(int id) async {
    final Database db = await createDataBase();
    return db.delete(_tableName, where: '$_id = ?', whereArgs: [id]);
  }
}
