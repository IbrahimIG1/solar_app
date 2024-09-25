// Base class for API result
import 'package:solar/core/models/data_error_model.dart';

abstract class DataResult<T> {
  const DataResult();

  // Factory method to create a success or failure
  factory DataResult.success(T data) => Success(data);
  factory DataResult.failure(ErrorModel error) => Failure(error);

  // This method can be overridden to handle both success and failure cases.
  void when({
    required void Function(T data) success,
    required void Function(ErrorModel error) failure,
  });
}

// Success subclass
class Success<T> extends DataResult<T> {
  final T data;

  Success(this.data) : super();

  @override
  void when({
    required void Function(T data) success,
    required void Function(ErrorModel error) failure,
  }) {
    success(data); // Call the success function with the data
  }
}

// Failure subclass
class Failure<T> extends DataResult<T> {
  final ErrorModel dataErrorModel;

  Failure(this.dataErrorModel) : super();

  @override
  void when({
    required void Function(T data) success,
    required void Function(ErrorModel error) failure,
  }) {
    failure(dataErrorModel); // Call the failure function with the error
  }
}
