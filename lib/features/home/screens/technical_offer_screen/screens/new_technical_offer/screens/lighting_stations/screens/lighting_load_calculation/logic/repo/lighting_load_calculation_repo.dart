import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';

class LightingRepo {
  final DbServices _databaseServices;

  LightingRepo(this._databaseServices);
  String tableName = "lighting_items_table";
  Future<DataResult<void>> addLightingData(
      String itemName, String itemImage) async {
    try {
      final response = _databaseServices.addLightingItimeInDatabase(
          tableName: tableName, itemName: itemName, itemImage: itemImage);
      return DataResult.success(response); // No data to return, success
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  Future<DataResult<List<Map<String, dynamic>>>> getLightingData() async {
    try {
      final data =
          await _databaseServices.getDataFromDatabase(tableName: tableName);
      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  DataResult<void> deleteLightingData(int id) {
    try {
      final responce =
          _databaseServices.deleteDatabase(tableName: tableName, id: id);
      return DataResult.success(responce);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }
}
