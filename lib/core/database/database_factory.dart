import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbFactory {
  Database? _database;

  Future<Database> initDatabase() async {
    print("Start init Database");
    if (_database != null) {
      print("in section not null");

      return _database!;
    } else {
      print("in section null");
      String databasesPath = await getDatabasesPath();
      String path = join(databasesPath);
      return await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        // await _createItemsTable(db: db, tableName: tableName);
      }, onOpen: (db) {});
    }
  }

//* create Database
  Future<Database> createDatabase({required String tableName}) async {
    print("Start create Database");

    if (_database == null) {
      print("in section null");

      _database =
          await _openData(databaseName: "app_data", tableName: tableName);
      return _database!;
    } else {
      print("in section not null");

      return _database!;
    }
  }

//* Open Databae
  Future<Database> _openData(
      {required String databaseName, required String tableName}) async {
    print("Start _openData Database");

    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
    print("Start _openData (onCreate) Database");

      // When creating the db, create the table
      await _createItemsTable(db: db, tableName: tableName);
    }, onOpen: (db) {
    print("Start _openData (onOpen) Database");
      
    });
  }

  /// create the items table in database [ name , image]
  Future<void> _createItemsTable(
      {required Database db, required String tableName}) async {
    print("Start _create Items Table Database");

    await db.execute(
        'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, image TEXT)');
  }
}
