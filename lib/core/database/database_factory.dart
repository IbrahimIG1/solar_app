import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseFactory {
  DatabaseFactory._init();
  Database? _database;

//* create Database
  Future<Database> createDatabase() async {
    if (_database != null) {
     _database = await openData();
      return _database!;
    } else {
      return _database!;
    }
  }

//* Open Databae
  Future<Database> openData() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app.dp');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await createTable(db,'lighting_load_calculation_items');
    }, onOpen: (db) {});
  }

  Future<void> createTable(Database db,String tableName) async {
    await db.execute(
        'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
  }

  void closeDatabase() {
    _database!.close();
  }
}
