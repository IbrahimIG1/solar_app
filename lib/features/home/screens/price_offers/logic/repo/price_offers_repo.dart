import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';
import 'package:solar/core/models/category_details_model.dart';

class PriceOffersRepo {
  final DbServices dbServices;

  PriceOffersRepo(this.dbServices);

  static const String tableName = categoryDetailsTableName;

  //* save prices data which added in price management screen (admin screen) from database in table (categoryDetailsTableName).
  Future<DataResult<void>> addLightinDetailsData(
      {required CategoryDetailsModel categoryDetailsModel}) async {
    try {
      final data = dbServices.addCategoryDetailsInDatabase(
          categoryDetailsModel: categoryDetailsModel, tableName: tableName);

      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  //* get data prices data which added in price management screen (admin screen) from database to show it as choose data in drop down buttons.
  Future<DataResult<List<Map<String, Object?>>>>
      getLightinDetailsDataFromData() async {
    try {
      final List<Map<String, Object?>> data =
          await dbServices.getDataFromDatabase(tableName: tableName);
      return DataResult.success(data);
    } on Exception catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  //* delete anyy device added from database
  DataResult<void> deleteLightingData(int id) {
    try {
      final responce = dbServices.deleteDatabase(tableName: tableName, id: id);
      return DataResult.success(responce);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }
}
