import 'package:solar/core/database/database_factory.dart';

class DatabaseServices {
  DatabaseServices(this.databaseFactory);
  final DatabaseFactory databaseFactory;

  
  void insertDatabase(
    String title,
    String time,
    String date,
  ) async {
    print("insertDatabase Start");
    final database = await databaseFactory.createDatabase();
    database
        .transaction(
      (txn) => txn.rawInsert(
          'INSERT INTO customers(title, time ,date ,status ) VALUES("$title", "$time" ,"$date","new")'),
    )
        .then((value) {
      print("insertDatabase End >> $value");
    });
  }

  List data = [];
  void getDatabase(database) {
    data = [];
    database.rawQuery!('SELECT * FROM customers').then((value) {
      value.forEach((element) {
        data.add(element);
      });
    });
  }
}
