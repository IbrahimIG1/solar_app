import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/helper/api_error_handler.dart';
import 'package:solar/core/helper/api_result.dart';
import 'package:solar/core/models/customer_model.dart';

class CustomerRepo {
  final DbServices dbServices;
  CustomerRepo(this.dbServices);

  static const String tableName = customerTableName;

  Future<DataResult<void>> addCustomer(
      {required CustomerModel customerModel}) async {
    try {
      final data = dbServices.addCustomerInfoInDatabase(
          customerModel: customerModel, tableName: customerTableName);
      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  Future<DataResult<List<Map<String, Object?>>>> getCustomer() async {
    try {
      final data = await dbServices.getDataFromDatabase(tableName: tableName);
      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }

  Future<DataResult<void>> deleteCustomer({required int id}) async {
    try {
      final data = dbServices.deleteDatabase(tableName: tableName, id: id);
      return DataResult.success(data);
    } catch (error) {
      return DataResult.failure(ErrorHandler.handleException(error));
    }
  }
}
