import 'package:solar/core/models/data_error_model.dart';
import 'package:sqflite/sqlite_api.dart';

class ErrorHandler {
  static ErrorModel handleException(dynamic error) {
    if (error is DatabaseException) {
      // sqflite Database Exceptions
      if (error.isNoSuchTableError()) {
        return ErrorModel(message: "The table does not exist.");
      } else if (error.isSyntaxError()) {
        return ErrorModel(message: "SQL syntax error.");
      } else if (error.isDatabaseClosedError()) {
        return ErrorModel(message: "Database is closed.");
      } else if (error.isReadOnlyError()) {
        return ErrorModel(message: "Database is read-only.");
      } else if (error.isUniqueConstraintError()) {
        return ErrorModel(message: "Unique constraint violation.");
      } else if (error.isOpenFailedError()) {
        return ErrorModel(message: "Failed to open the database.");
      } else {
        return ErrorModel(message: "Database operation failed.");
      }
    } else {
      // Unknown error
      return ErrorModel(message: "An unknown error occurred.");
    }
  }
}
