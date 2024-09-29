import 'package:solar/core/models/data_error_model.dart';

abstract class LightingCalculationState {}

final class LightingCalculationInitial extends LightingCalculationState {}

//* Create Database
final class CreateDatabaseStateLoading extends LightingCalculationState {}

final class CreateDatabaseStateSuccess extends LightingCalculationState {}

final class CreateDatabaseStateError extends LightingCalculationState {}

//* Add Database
final class AddDatabaseStateLoading extends LightingCalculationState {}

final class AddDatabaseStateSuccess extends LightingCalculationState {}

final class AddDatabaseStateError extends LightingCalculationState {
  ErrorModel errorModel;
 AddDatabaseStateError(this.errorModel);
}

//* Get Database
final class GetDatabaseStateLoading extends LightingCalculationState {}

final class GetDatabaseStateSuccess extends LightingCalculationState {
  List<Map<String, dynamic>> data;
  GetDatabaseStateSuccess(this.data);
}

final class GetDatabaseStateError extends LightingCalculationState {
  ErrorModel errorModel;
  GetDatabaseStateError(this.errorModel);
}

//* Delete Database
final class DeleteDatabaseStateLoading extends LightingCalculationState {}

final class DeleteDatabaseStateSuccess extends LightingCalculationState {
 
}

final class DeleteDatabaseStateError extends LightingCalculationState {
   ErrorModel errorModel;
  DeleteDatabaseStateError(this.errorModel);
}

//* Choose Image
final class ChooseStateLoading extends LightingCalculationState {}

final class ChooseStateSuccess extends LightingCalculationState {}

final class ChooseStateError extends LightingCalculationState {}
