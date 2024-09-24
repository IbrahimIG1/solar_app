
abstract class LightingCalculationState {}

final class LightingCalculationInitial extends LightingCalculationState {}

//* Create Database
final class CreateDatabaseStateLoading extends LightingCalculationState {}
final class CreateDatabaseStateSuccess extends LightingCalculationState {}
final class CreateDatabaseStateError extends LightingCalculationState {}

//* Insert Database
final class InsertDatabaseStateLoading extends LightingCalculationState {}
final class InsertDatabaseStateSuccess extends LightingCalculationState {}
final class InsertDatabaseStateError extends LightingCalculationState {}

//* Get Database
final class GetDatabaseStateLoading extends LightingCalculationState {}
final class GetDatabaseStateSuccess extends LightingCalculationState {}
final class GetDatabaseStateError extends LightingCalculationState {}

//* Delete Database
final class DeleteDatabaseStateLoading extends LightingCalculationState {}
final class DeleteDatabaseStateSuccess extends LightingCalculationState {}
final class DeleteDatabaseStateError extends LightingCalculationState {}


//* Choose Image
final class ChooseStateLoading extends LightingCalculationState {}
final class ChooseStateSuccess extends LightingCalculationState {}
final class ChooseStateError extends LightingCalculationState {}