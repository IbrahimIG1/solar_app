import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/models/customer_model.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_state.dart';
import 'package:solar/features/home/screens/customer_screen/logic/repo/customer_repo.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final CustomerRepo customerRepo;
  CustomerCubit(this.customerRepo) : super(CustomerInitialState());
  static CustomerCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stationController = TextEditingController();
  TextEditingController offerExpireController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  bool loading = false;

  Future<void> pickeDateOfferExpire(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      offerExpireController.text = selectedDate.toString().split(' ')[0];
      print(offerExpireController.text);
      emit(CustomerPickDateOfferSuccessState());
    }
  }

  void addCustomer() async {
    emit(AddCustomerDataLoadingState());
    CustomerModel customerModel = CustomerModel(
        nameController.text,
        phoneController.text,
        stationController.text,
        offerExpireController.text,
        addressController.text);
    final response =
        await customerRepo.addCustomer(customerModel: customerModel);
    response.when(success: (data) {
      nameController.text = "";
      phoneController.text = "";
      stationController.text = "";
      offerExpireController.text = "";
      addressController.text = "";
      getCustomerData();
      emit(AddCustomerDataSuccessState());
    }, failure: (error) {
      emit(AddCustomerDataErrorState(error));
    });
  }

  List<Map<String, dynamic>> customersList = [];
  void getCustomerData() async {
    emit(GetCustomerDataLoadingState());
    customersList = [];
    final response = await customerRepo.getCustomer();
    response.when(success: (data) {
      
      customersList = data;
      emit(GetCustomerDataSuccessState());
    }, failure: (error) {
      emit(GetCustomerDataErrorState(error));
    });
  }

  void delete(int id) async {
    final response = await customerRepo.deleteCustomer(id: id);
    response.when(success: (data) {
      getCustomerData();
      // emit(DeleteCustomerDataSuccessState());
    }, failure: (error) {
      emit(DeleteCustomerDataErrorState(error));
    });
  }
}
