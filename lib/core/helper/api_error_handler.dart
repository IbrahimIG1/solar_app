import 'package:solar/core/models/data_error_model.dart';
import 'package:sqflite/sqlite_api.dart';

class ApiErrorHandler {
  static ApiErrorModel handleException(dynamic error) {
    if (error is DatabaseException) {
      // sqflite Database Exceptions
      if (error.isNoSuchTableError()) {
        return ApiErrorModel(message: "The table does not exist.");
      } else if (error.isSyntaxError()) {
        return ApiErrorModel(message: "SQL syntax error.");
      } else if (error.isDatabaseClosedError()) {
        return ApiErrorModel(message: "Database is closed.");
      } else if (error.isReadOnlyError()) {
        return ApiErrorModel(message: "Database is read-only.");
      } else if (error.isUniqueConstraintError()) {
        return ApiErrorModel(message: "Unique constraint violation.");
      } else if (error.isOpenFailedError()) {
        return ApiErrorModel(message: "Failed to open the database.");
      } else {
        return ApiErrorModel(message: "Database operation failed.");
      }
    } else {
      // Unknown error
      return ApiErrorModel(message: "An unknown error occurred.");
    }
  }
}
