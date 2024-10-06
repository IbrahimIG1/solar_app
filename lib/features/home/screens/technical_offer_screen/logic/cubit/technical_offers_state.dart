import 'package:solar/core/models/data_error_model.dart';

abstract class TechnicalOffersState {}

final class LightingCalculationInitial extends TechnicalOffersState {}

//* Create Database
final class CreateDatabaseStateLoading extends TechnicalOffersState {}

final class CreateDatabaseStateSuccess extends TechnicalOffersState {}

final class CreateDatabaseStateError extends TechnicalOffersState {}

//* Add Database
final class AddDatabaseStateLoading extends TechnicalOffersState {}

final class AddDatabaseStateSuccess extends TechnicalOffersState {}

final class AddDatabaseStateError extends TechnicalOffersState {
  ErrorModel errorModel;
  AddDatabaseStateError(this.errorModel);
}

//* Get Database
final class GetDatabaseStateLoading extends TechnicalOffersState {}

final class GetDatabaseStateSuccess extends TechnicalOffersState {
  List<Map<String, dynamic>> data;
  GetDatabaseStateSuccess(this.data);
}

final class GetDatabaseStateError extends TechnicalOffersState {
  ErrorModel errorModel;
  GetDatabaseStateError(this.errorModel);
}

//* Delete Database
final class DeleteDatabaseStateLoading extends TechnicalOffersState {}

final class DeleteDatabaseStateSuccess extends TechnicalOffersState {}

final class DeleteDatabaseStateError extends TechnicalOffersState {
  ErrorModel errorModel;
  DeleteDatabaseStateError(this.errorModel);
}

//* Choose Image
final class ChooseStateLoading extends TechnicalOffersState {}

final class ChooseStateSuccess extends TechnicalOffersState {}

final class ChooseStateError extends TechnicalOffersState {}
