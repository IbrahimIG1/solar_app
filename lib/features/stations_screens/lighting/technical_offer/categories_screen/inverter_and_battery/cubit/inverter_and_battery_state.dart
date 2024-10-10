
import 'package:solar/core/models/data_error_model.dart';

abstract class InverterAndBatteryState {}

final class InverterAndBatteryInitial extends InverterAndBatteryState {}

//* FireStore States

//* Add Panals Data State
final class AddPanalDataSuccess extends InverterAndBatteryState {}

final class AddPanalDataError extends InverterAndBatteryState {
  ErrorModel error;
  AddPanalDataError(this.error);
}
//* Add Inverters Data State
final class AddDataLoading extends InverterAndBatteryState {}

final class AddInvertersDataSuccess extends InverterAndBatteryState {}

final class AddInvertersDataError extends InverterAndBatteryState {
  ErrorModel error;
  AddInvertersDataError(this.error);
}
//* Get Data

final class GetDataLoading extends InverterAndBatteryState {}

final class GetDataSuccess extends InverterAndBatteryState {}

final class GetDataError extends InverterAndBatteryState {
  ErrorModel error;
  GetDataError(this.error);
}

//* Radio Buttons State
final class ChangeRadioButtonsSuccess extends InverterAndBatteryState {}
