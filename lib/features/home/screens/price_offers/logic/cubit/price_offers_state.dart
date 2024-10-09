import 'package:solar/core/models/data_error_model.dart';

sealed class LightingCategoriesCalculationState {}

final class LightingCategoriesCalculationInitial
    extends LightingCategoriesCalculationState {}

//* Done check State
final class IsDoneLightingCategories
    extends LightingCategoriesCalculationState {}

//* PDF State
final class PdfSaveDataToGenerate extends LightingCategoriesCalculationState {}

//* Save Value Selected
final class SaveValueSeleted extends LightingCategoriesCalculationState {}

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

final class ResetCategoriesData extends LightingCategoriesCalculationState {}

//* Get All Pdf State
final class GetAllPdfSuccess extends LightingCategoriesCalculationState {}
final class GetAllPdfError extends LightingCategoriesCalculationState {}

//* Open Pdf State
final class OpenPdfSuccess extends LightingCategoriesCalculationState {}
final class OpenPdfError extends LightingCategoriesCalculationState {
  final ErrorModel errorModel;
  OpenPdfError(this.errorModel);
}

//* Delete Pdf State
final class DeletePdfSuccess extends LightingCategoriesCalculationState {}
final class DeletePdfError extends LightingCategoriesCalculationState {
  final DeletePdfError errorModel;
  DeletePdfError(this.errorModel);
}

