import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/drink_dao.dart';

createDataBase() async{
  final String path =join(await getDatabasesPath(), 'drink.db');
  return openDatabase(path, onCreate: (db, version){
    db.execute(DrinkDao.tableSql);
  }, version: 1);
}