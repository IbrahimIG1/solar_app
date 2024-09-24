import 'package:solar/core/database/database_factory.dart';

class DatabaseServices {
  DatabaseServices(this.databaseFactory);
  final DatabaseFactory databaseFactory;

  Future<void> addData(String table, Map<String, dynamic> data) async {
    final db = await databaseFactory.createDatabase();
    await db.insert(table, data);
  }
  Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await databaseFactory.createDatabase();
    return await db.query(table);
  }

  void insertDatabase(
    String name,
    String icon,
  ) async {
    print("insertDatabase Start");
    final database = await databaseFactory.createDatabase();
    database
        .transaction(
      (txn) => txn.rawInsert(
          'INSERT INTO lighting_load_calculation_items(name, icon) VALUES("$name", "$icon")'),
    )
        .then((value) {
      print("insertDatabase End >> $value");
    });
  }

  // // List data = [];
  // void getDatabase(database) {
  //   // data = [];
  //   database.rawQuery('SELECT * FROM lighting_load_calculation_items');
  //   // .then((value) {
  //   //   value.forEach((element) {
  //   //     // data.add(element);
  //   //   });
  //   // }
  //   // );
  // }
}
