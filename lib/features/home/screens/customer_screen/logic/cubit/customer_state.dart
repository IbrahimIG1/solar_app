import 'package:solar/core/models/data_error_model.dart';

sealed class CustomerState {}

final class CustomerInitialState extends CustomerState {}

final class CustomerPickDateOfferSuccessState extends CustomerState {}

//* Get Data States
final class GetCustomerDataLoadingState extends CustomerState {}

final class GetCustomerDataSuccessState extends CustomerState {}

final class GetCustomerDataErrorState extends CustomerState {
  final ErrorModel error;
  GetCustomerDataErrorState(this.error);
}

//* Add Data States
final class AddCustomerDataLoadingState extends CustomerState {}

final class AddCustomerDataSuccessState extends CustomerState {}

final class AddCustomerDataErrorState extends CustomerState {
  final ErrorModel error;
  AddCustomerDataErrorState(this.error);
}

//* Delete Data States
final class DeleteCustomerDataLoadingState extends CustomerState {}

final class DeleteCustomerDataSuccessState extends CustomerState {}

final class DeleteCustomerDataErrorState extends CustomerState {
  final ErrorModel error;
  DeleteCustomerDataErrorState(this.error);
}
