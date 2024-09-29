import 'package:solar/core/models/data_error_model.dart';

sealed class LightingCategoriesCalculationState {}

final class LightingCategoriesCalculationInitial
    extends LightingCategoriesCalculationState {}

final class IsDoneLightingCategories
    extends LightingCategoriesCalculationState {}

//* Categories Details states

final class AddCategoriesDetailsLoading
    extends LightingCategoriesCalculationState {}

final class AddCategoriesDetailsSuccess
    extends LightingCategoriesCalculationState {}

final class AddCategoriesDetailsError
    extends LightingCategoriesCalculationState {
  final ErrorModel errorModel;
  AddCategoriesDetailsError(this.errorModel);
}

final class GetCategoriesDetailsSuccess
    extends LightingCategoriesCalculationState {}

final class GetCategoriesDetailsError
    extends LightingCategoriesCalculationState {
  final ErrorModel errorModel;
  GetCategoriesDetailsError(this.errorModel);
}

final class GetCategoriesDetailsLoading
    extends LightingCategoriesCalculationState {}

//* Categories Details states
final class AddRowInTableSuccess extends LightingCategoriesCalculationState {}

final class AddRowInTableError extends LightingCategoriesCalculationState {
  final ErrorModel errorModel;
  AddRowInTableError(this.errorModel);
}

final class AddRowInTableLoading extends LightingCategoriesCalculationState {}
