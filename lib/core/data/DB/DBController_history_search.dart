import 'package:sqflite/sqflite.dart';

import '../models/UserAuth.dart';
import 'DBController_abst.dart';

class DBController_history_search extends DBController_abst<UserAuth> {
  static const String _tableName = "search_history";
  Database? _db;
  static const String _path = "search_history.db";

  @override
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  @override
  initDatabase() async {
    try {
      var db = await openDatabase(
        _path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, search TEXT )',
          );
        },
      );
      return db;
    } catch (e) {
      print('\x1B[31m$e\x1B[0m');
    }
  }

  @override
  Future<UserAuth> insert(UserAuth userAuthModel) async {
    var dbClient = await db;
    await dbClient!.insert(_tableName, userAuthModel.toMap());
    return userAuthModel;
  }

  @override
  Future<List<UserAuth>> getDataList() async {
    try {
      var dbClient = await db;
      final List<Map<String, dynamic>> queryResult =
          await dbClient!.query(_tableName);
      return queryResult.map((e) => UserAuth.fromMap(e)).toList();
    } catch (e) {
      Exception(e);
    }
    return [];
  }

  @override
  Future<int> update(UserAuth model) async {
    var dbClient = await db;
    return await dbClient!.update(
      _tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}
