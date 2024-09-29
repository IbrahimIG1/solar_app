import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';
import 'package:solar/core/models/category_details_model.dart';

class LightingCategoriesCalculationRepo {
  final DbServices dbServices;

  LightingCategoriesCalculationRepo(this.dbServices);

  Future<DataResult<void>> addLightinDetailsData(
      {required CategoryDetailsModel categoryDetailsModel}) async {
    try {
      final data = dbServices.addCategoryDetailsInDatabase(
          categoryDetailsModel: categoryDetailsModel,
          tableName: categoryDetailsTableName);

      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  Future<DataResult<List<Map<String, Object?>>>> getLightinDetailsDataFromData() async {
    try {
      final List<Map<String, Object?>> data = await dbServices
          .getDataFromDatabase(tableName: categoryDetailsTableName);     
      return DataResult.success(data);
    } on Exception catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }
}
