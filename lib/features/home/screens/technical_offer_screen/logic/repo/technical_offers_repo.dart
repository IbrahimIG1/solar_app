import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';

class TechnicalOffersRepo {
  final DbServices _databaseServices;

  TechnicalOffersRepo(this._databaseServices);

  static const String tableName = lightingItemsTableName;

  //* add lighting devices from place to database in this table(lightingItemsTableName).
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

  //* get all devices which added by user from database from this table(lightingItemsTableName)
  Future<DataResult<List<Map<String, dynamic>>>> getLightingData() async {
    try {
      final data =
          await _databaseServices.getDataFromDatabase(tableName: tableName);
      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  //* delete anyy device added from database
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
