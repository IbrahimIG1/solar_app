// Base class for API result
import 'package:solar/core/models/data_error_model.dart';

abstract class ApiResult<T> {
  const ApiResult();

  // Factory method to create a success or failure
  factory ApiResult.success(T data) => Success(data);
  factory ApiResult.failure(ApiErrorModel error) => Failure(error);

  // This method can be overridden to handle both success and failure cases.
  void when({
    required void Function(T data) success,
    required void Function(ApiErrorModel error) failure,
  });
}

// Success subclass
class Success<T> extends ApiResult<T> {
  final T data;

  Success(this.data) : super();

  @override
  void when({
    required void Function(T data) success,
    required void Function(ApiErrorModel error) failure,
  }) {
    success(data); // Call the success function with the data
  }
}

// Failure subclass
class Failure<T> extends ApiResult<T> {
  final ApiErrorModel dataErrorModel;

  Failure(this.dataErrorModel) : super();

  @override
  void when({
    required void Function(T data) success,
    required void Function(ApiErrorModel error) failure,
  }) {
    failure(dataErrorModel); // Call the failure function with the error
  }
}
