import 'package:sqflite/sqflite.dart';

abstract class DBController_abst<T> {
  late String tableName;
  late String path;
  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, token TEXT )',
        );
      },
    );
    return db;
  }

  Future<T> insert(T model);

  Future<List<T>> getDataList();

  Future<int> update(T model);

  Future<void> closeDatabase() async {
    var dbClient = await db;
    await dbClient?.close();
    _db = null;
  }
}
