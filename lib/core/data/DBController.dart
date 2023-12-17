import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io';

import 'models/UserAuth.dart';

class DBController {
  static String tableName = "user_auth";
  Database? _db;
  static String _path = "database.db";

  Future<Database> database = openDatabase(
    'path/to/database.db',
    version: 1,
    onCreate: (db, version) {
      db.execute("CREATE TABLE $tableName");
    },
  );

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

//Создание таблицы
  initDatabase() async {
    var db = await openDatabase(
      _path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, token TEXT )',
        );
      },
    );
    return db;
  }

//Запись в бд. Обновляем только первую строку
  Future<UserAuth> insert(UserAuth userAuthModel) async {
    var dbClient = await db;
    await dbClient!.insert(tableName, userAuthModel.toMap());
    return userAuthModel;
  }

//Получение данных из бд в виде списка
  Future<List<UserAuth>> getDataList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query(tableName);
    print(queryResult);
    return queryResult.map((e) => UserAuth.fromMap(e)).toList();
  }

  //Обновление по id
  Future<int> updateQuantity(UserAuth userAuthModel) async {
    var dbClient = await db;
    return await dbClient!.update(
      tableName,
      userAuthModel.toMap(),
      where: 'id = ?',
      whereArgs: [userAuthModel.id],
    );
  }
}
