sealed class LightingCategoriesCalculationState {}

final class LightingCategoriesCalculationInitial
    extends LightingCategoriesCalculationState {}

final class IsDoneLightingCategories
    extends LightingCategoriesCalculationState {
  final bool isDone;
  IsDoneLightingCategories(this.isDone);
}
