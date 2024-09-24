
import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';

class LightingLoadCalculationRepo {
  final DatabaseServices? _databaseServices;

  LightingLoadCalculationRepo(this._databaseServices);

  Future<ApiResult<void>> addData(String table, Map<String, dynamic> data) async {
    try {
      await _databaseServices!.addData(table, data);
      return ApiResult.success(null); // No data to return, success
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }


 Future<ApiResult<List<Map<String, dynamic>>>> getData(String table) async {
    try {
      final data = await _databaseServices!.getData(table);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleException(error));
    }
  }
}
