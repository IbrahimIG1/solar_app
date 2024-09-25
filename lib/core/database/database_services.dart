import 'package:solar/core/database/database_factory.dart';
import 'package:sqflite/sqflite.dart';

class DbServices {
  DbServices(this.dbFactory);
  final DbFactory dbFactory;

  void addLightingItimeInDatabase({
    required String itemName,
    required String tableName,
    required String itemImage,
  }) async {
    final Database database =
        await dbFactory.createDatabase(tableName: tableName);
    database.transaction(
      (txn) => txn.rawInsert(
          'INSERT INTO $tableName(name, image) VALUES("$itemName","$itemImage")'),
    );
  }

  //* get table data from database
  Future<List<Map<String, Object?>>> getDataFromDatabase(
      {required String tableName}) async {
    final Database database =
        await dbFactory.createDatabase(tableName: tableName);
    return await database.rawQuery('SELECT * FROM $tableName');
  }

  //* delete specific item From table
  void deleteDatabase({required String tableName, required int id}) async {
    final Database database =
        await dbFactory.createDatabase(tableName: tableName);
    database.rawDelete('DELETE FROM $tableName WHERE id=?', [id]);
  }

  void closeDatabase({required String tableName}) async {
    final Database database =
        await dbFactory.createDatabase(tableName: tableName);
    database.close();
  }
}
