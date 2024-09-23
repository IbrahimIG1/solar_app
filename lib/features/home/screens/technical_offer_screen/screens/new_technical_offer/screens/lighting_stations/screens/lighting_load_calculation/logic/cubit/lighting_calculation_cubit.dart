import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_state.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LightingCalculationCubit extends Cubit<LightingCalculationState> {
  // final DatabaseServices databaseServices;
  LightingCalculationCubit() : super(LightingCalculationInitial());
  static LightingCalculationCubit get(context) => BlocProvider.of(context);

  late Database database;
  void createDatabase() async {
    var directory = await getDatabasesPath();
    var path = join(directory, 'solar.db');
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, version) async {
      await db.execute(
          'CREATE TABLE lighting_load_calculation_items (id INTEGER PRIMARY KEY, name TEXT, icon TEXT)');
      print('createDatabase success');
    }, onOpen: (database) {
      print('in onOpen ');
      getDatabase(database);
    });
    emit(CreateDatabaseStateSuccess());
  }

  void insertDatabase(
    String name,
    String icon,
  ) {
    database.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO lighting_load_calculation_items(name, icon) VALUES("$name","$icon")')
            .then((value) {
          print('insertDatabase success');
          emit(InsertDatabaseStateSuccess());
          getDatabase(database);
        }));
  }

  List<String> lightingIconsList = [];

  void getDatabase(database) {
    emit(GetDatabaseStateLoading());
    // lightingIconsList = [];
    database.rawQuery!('SELECT * FROM lighting_load_calculation_items')
        .then((value) {
      value.forEach((element) {
        lightingIconsList.add(element['icon']);
        print(element);
      });
      lightingIconsList.add('assets/images/add_icon.png');
      print('Get Database Success');
      print(lightingIconsList.length);
      emit(GetDatabaseStateSuccess());
    });
  }

  void deleteDatabase(int id) {
    database.rawDelete('DELETE FROM lighting_load_calculation_items WHERE id=?',
        [id]).then((value) {
      getDatabase(database);
      emit(DeleteDatabaseStateSuccess());
    });
  }

  // File Save Image Which Selected From Gallary
  File? imageFile;
  // ImagePicker Go To Get Images From Gallary
  var picker = ImagePicker();

  // Function To Change Profile Image
  Future<String> getProfileImage() async {
    try {
      picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile!.path);
      print('Get Image');
      print(pickedFile.path);
      return pickedFile.path;
    } catch (e) {
      print('Error in Choose Image >>> ${e.toString()}');
      emit(ChooseStateSuccess());
      return "";
    }
  }
}
