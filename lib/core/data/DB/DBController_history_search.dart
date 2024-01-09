import 'package:spoosk/core/data/models/ResortById.dart';

import 'package:sqflite/sqflite.dart';
import '../models/resorts.dart';
import 'DBController_abst.dart';

class DBController_history_search extends DBController_abst<Result> {
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
          await db.execute('''
  CREATE TABLE ${_tableName} (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_resort TEXT,
    name TEXT,
    region TEXT,
    rating INTEGER,
    image TEXT,
    trail_length REAL,
    height_difference REAL,
    skipass REAL,
    trail_number INTEGER
    CONSTRAINT max_rows CHECK (id <= 3)    
  )
''');
        },
      );
      return db;
    } catch (e) {
      print('\x1B[31m$e\x1B[0m');
    }
  }

  @override
  Future<Result> insert(Result resultModel) async {
    final dbClient = await db;
    final List<Result> oldData = await getDataList();
    final List<Result> newData = [resultModel, ...oldData];

    newData.removeLast();
    print(oldData.length);
    if (oldData.length == 3) {
      for (int i = 0; i < 3; i++) {
        print("KEK ${i}");
        await dbClient!
            .update(_tableName, newData[i].toMap(), where: 'id = ${i + 1}');
      }
    } else {
      await dbClient!.insert(_tableName, resultModel.toMap());
    }
    return resultModel;
  }

  @override
  Future<List<Result>> getDataList() async {
    try {
      var dbClient = await db;
      final List<Map<String, dynamic>> queryResult =
          await dbClient!.query(_tableName);
      return queryResult.map((e) => Result.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> update(Result model) async {}
}
