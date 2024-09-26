import 'package:solar/core/database/database_factory.dart';
import 'package:solar/core/models/customer_model.dart';
import 'package:sqflite/sqflite.dart';

class DbServices {
  DbServices(this.dbFactory);
  final DbFactory dbFactory;

//* Add Tables in Database
  void addLightingItimeInDatabase({
    required String itemName,
    required String tableName,
    required String itemImage,
  }) async {
    final Database database = await dbFactory.createDatabase();
    database.transaction(
      (txn) => txn.rawInsert(
          'INSERT INTO $tableName(name, image) VALUES("$itemName","$itemImage")'),
    );
  }

  void addCustomerInfoInDatabase({
    required CustomerModel customerModel,
    required String tableName,
  }) async {
    final Database database = await dbFactory.createDatabase();
    database.transaction(
      (txn) => txn.rawInsert(
        'INSERT INTO $tableName(name, address, phone, station_type, offer_expiry_date) VALUES("${customerModel.customerName}","${customerModel.customerAddress}","${customerModel.customerPhone}","${customerModel.stationType}","${customerModel.offerExpiryDate}")',
      ),
    );
  }

  //* get table data from database
  Future<List<Map<String, Object?>>> getDataFromDatabase(
      {required String tableName}) async {
    final Database database = await dbFactory.createDatabase();
    return await database.rawQuery('SELECT * FROM $tableName');
  }

  //* delete specific item From table
  void deleteDatabase({required String tableName, required int id}) async {
    final Database database = await dbFactory.createDatabase();
    database.rawDelete('DELETE FROM $tableName WHERE id=?', [id]);
  }

  void closeDatabase({required String tableName}) async {
    final Database database = await dbFactory.createDatabase();
    database.close();
  }
}
