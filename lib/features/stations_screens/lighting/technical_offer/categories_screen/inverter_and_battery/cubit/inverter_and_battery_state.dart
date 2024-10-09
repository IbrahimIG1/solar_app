
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
//* Get Panals Data

final class GetPanalDataLoading extends InverterAndBatteryState {}

final class GetPanalDataSuccess extends InverterAndBatteryState {}

final class GetPanalDataError extends InverterAndBatteryState {
  ErrorModel error;
  GetPanalDataError(this.error);
}
//* Get Panals Data

final class GetInvertersDataLoading extends InverterAndBatteryState {}

final class GetInvertersDataSuccess extends InverterAndBatteryState {}

final class GetInvertersDataError extends InverterAndBatteryState {
  ErrorModel error;
  GetInvertersDataError(this.error);
}

//* Radio Buttons State
final class ChangeRadioButtonsSuccess extends InverterAndBatteryState {}
