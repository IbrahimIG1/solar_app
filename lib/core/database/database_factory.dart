import 'package:path/path.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:sqflite/sqflite.dart';

class DbFactory {
  Database? _database;

//* create Database
  Future<Database> createDatabase() async {
    print("Start create Database");

    if (_database == null) {
      print("in section null");

      _database =
          await _openData(databaseName: "app_data");
      return _database!;
    } else {
      print("in section not null");

      return _database!;
    }
  }

//* Open Databae
  Future<Database> _openData(
      {required String databaseName}) async {
    print("Start _openData Database");

    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print("Start _openData (onCreate) Database");

      // When creating the db, create the table
      await _createItemsTable(db: db);
    }, onOpen: (db) {
      print("Start _openData (onOpen) Database");
    });
  }

  /// create the items table in database [ name , image]
  Future<void> _createItemsTable(
      {required Database db}) async {
    print("Start _create Items Table Database");
    
    //* Items table
    await db.execute(
        'CREATE TABLE $lightingItemsTableName (id INTEGER PRIMARY KEY, name TEXT, image TEXT)');
    await db.execute(
        'CREATE TABLE $customerTableName (id INTEGER PRIMARY KEY, name TEXT, address TEXT, phone TEXT, station_type TEXT, offer_expiry_date TEXT)');
  }
}
