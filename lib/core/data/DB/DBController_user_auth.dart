import 'package:spoosk/core/data/models/user_login.dart';
import 'package:sqflite/sqflite.dart';

import 'DBController_abst.dart';

class DBController_user_auth extends DBController_abst<UserData> {
  static const String _tableName = "user_auth";
  Database? _db;
  static const String _path = "user_auth.db";

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
    var db = await openDatabase(
      _path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, token TEXT)',
        );
      },
    );
    return db;
  }

  @override
  Future<UserData> insert(UserData userAuthModel) async {
    var dbClient = await db;
    await dbClient!.insert(_tableName, userAuthModel.toMap());
    return userAuthModel;
  }

  @override
  Future<List<UserData>> getDataList() async {
    try {
      var dbClient = await db;
      final List<Map<String, dynamic>> queryResult =
          await dbClient!.query(_tableName);
      return queryResult.map((e) => UserData.fromMap(e)).toList();
    } catch (e) {
      Exception(e);
    }
    return [];
  }

  @override
  Future<int> update(UserData model) async {
    var dbClient = await db;
    return await dbClient!.update(
      _tableName,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }
}
