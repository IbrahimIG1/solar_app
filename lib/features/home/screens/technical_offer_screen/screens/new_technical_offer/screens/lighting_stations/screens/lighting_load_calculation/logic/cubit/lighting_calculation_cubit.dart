import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LightingCalculationCubit extends Cubit<LightingCalculationState> {
  // final DatabaseServices databaseServices;
  LightingCalculationCubit() : super(LightingCalculationInitial());
  static LightingCalculationCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  Database? _database;

  void createDatabase() async {
    var directory = await getDatabasesPath();
    var path = join(directory, 'solar.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, version) async {
      await db.execute(
          'CREATE TABLE lighting_load_calculation_items (id INTEGER PRIMARY KEY, name TEXT, icon TEXT)');
      print('createDatabase success');
    }, onOpen: (database) {
      print('in onOpen ');
      // getDatabase(database);
    });
    getDatabase(_database!);
    emit(CreateDatabaseStateSuccess());
  }

  void insertDatabase(
    String name,
    String icon,
  ) {
    _database!.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO lighting_load_calculation_items(name, icon) VALUES("$name","$icon")')
            .then((value) {
          print('insertDatabase success');
          emit(InsertDatabaseStateSuccess());
          getDatabase(_database!);
        }));
  }

  List<Map<String, dynamic>> lightingIconsList = [];

  void getDatabase(Database database) async {
    emit(GetDatabaseStateLoading());
    lightingIconsList = [];
    await database
        .rawQuery('SELECT * FROM lighting_load_calculation_items')
        .then((value) {
      value.forEach((element) {
        lightingIconsList.add(element);
        print(element);
      });
      print('Get Database Success');
      print(lightingIconsList.length);
    });
    emit(GetDatabaseStateSuccess());
  }

  void deleteDatabase(int id) {
    _database!.rawDelete(
        'DELETE FROM lighting_load_calculation_items WHERE id=?',
        [id]).then((value) {
      getDatabase(_database!);
      emit(DeleteDatabaseStateSuccess());
    });
  }

  // File Save Image Which Selected From Gallary
  File? imageFile;
  // ImagePicker Go To Get Images From Gallary
  var picker = ImagePicker();
  String? imagePath;
  // Function To Change Profile Image
  Future<String> getImage() async {
    try {
      picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile!.path);

      print('Get Image');
      print(pickedFile.path);
      imagePath = pickedFile.path;
      return pickedFile.path;
    } catch (e) {
      print('Error in Choose Image >>> ${e.toString()}');
      emit(ChooseStateSuccess());
      return "";
    }
  }
}
