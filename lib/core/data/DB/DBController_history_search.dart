import 'package:sqflite/sqflite.dart';

import '../models/resorts.dart';
import 'DBController_abst.dart';

class DBController_history_search extends DBControllerAbsrt<Resort> {
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
    trail_number INTEGER,
    number_reviews INTEGER
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
  Future<Resort> insert(Resort resultModel) async {
    try {
      final dbClient = await db;
      final List<Resort> oldData = await getDataList();
      final List<Resort> newData = [resultModel, ...oldData];

      newData.removeLast();

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
    } catch (e) {
      print("Error inserting data: $e");
      return resultModel; // or handle the error as needed
    }
  }

  @override
  Future<List<Resort>> getDataList() async {
    try {
      var dbClient = await db;
      final List<Map<String, dynamic>> queryResult =
          await dbClient!.query(_tableName);
      return queryResult.map((e) => Resort.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> update(Resort model) async {}
}
