import 'package:solar/core/models/data_error_model.dart';

abstract class AdminState {}

final class AdminInitial extends AdminState {}

//* FireStore States

//* Add Panals Data State
final class AddPanalDataSuccess extends AdminState {}

final class AddPanalDataError extends AdminState {
  ErrorModel error;
  AddPanalDataError(this.error);
}
//* Add Inverters Data State
final class AddDataLoading extends AdminState {}

final class AddInvertersDataSuccess extends AdminState {}

final class AddInvertersDataError extends AdminState {
  ErrorModel error;
  AddInvertersDataError(this.error);
}
//* Get Data

final class GetPanalDataLoading extends AdminState {}

final class GetPanalDataSuccess extends AdminState {}

final class GetPanalDataError extends AdminState {
  ErrorModel error;
  GetPanalDataError(this.error);
}

//* Radio Buttons State
final class ChangeRadioButtonsSuccess extends AdminState {}
